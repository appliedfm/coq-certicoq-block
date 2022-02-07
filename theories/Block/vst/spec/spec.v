From VST Require Import floyd.proofauto.

From appliedfm Require Import int_or_ptr.vst.cmodel.val.

From CertiCoq Require Import Block.vst.ast.ast.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block_header.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block.
From CertiCoq Require Import Block.vst.clightgen.block.


Definition block_header_type: type
 := if Archi.ptr64
    then tulong
    else tuint.

Definition size_type: type
 := if Archi.ptr64
    then tulong
    else tuint.


Definition block_header_offset (p: val): val
 := offset_val (- constants.word_size) p.

Definition block_header_at (sh: share) (h: BlockHeader) (p: val):
  mpred
 := data_at sh (tarray block_header_type 1) [block_header_encode_val h] p.

Definition block_fields_at (sh: share) (h: Block) (p: val):
  mpred
 := data_at sh (tarray int_or_ptr_type (Zlength (block_fields h))) (map int_or_ptr__to_val (block_fields h)) p.

Definition block_at (sh: share) (h: Block) (p: val):
  mpred
 := (block_header_at sh (block_header h) (block_header_offset p) * block_fields_at sh h p)%logic.


Definition certicoq_block__init_spec :=
  DECLARE _certicoq_block__init
  WITH
    h : BlockHeader,
    dst_sh : share,
    dst : val,
    header_sh : share,
    header: val
  PRE [ tptr int_or_ptr_type ]
    PROP (writable_share dst_sh ; readable_share header_sh)
    PARAMS (dst ; header)
    GLOBALS ()
    SEP (block_header_at header_sh h header * memory_block dst_sh (block_header_size h) dst)
  POST [ tptr int_or_ptr_type ]
    PROP ()
    LOCAL (temp ret_temp (block_header_size_val h))
    SEP (block_header_at header_sh h header * block_at dst_sh (block_init h) dst).


(*
TODO:

certicoq_block_t certicoq_block__of_header(certicoq_block_header_t *header);
certicoq_block_t certicoq_block__copy(int_or_ptr *dst, const certicoq_block_t src);

certicoq_block_header_t *certicoq_block__header_get_ptr(const certicoq_block_t block);
void certicoq_block__header_set(certicoq_block_t block, const certicoq_block_header_t *header);
*)

Definition certicoq_block__size_get_spec :=
  DECLARE _certicoq_block__size_get
  WITH
    h : BlockHeader,
    sh : share,
    p : val
  PRE [ tptr block_header_type ]
    PROP (readable_share sh)
    PARAMS (p)
    GLOBALS ()
    SEP (block_header_at sh h p)
  POST [ size_type ]
    PROP ()
    LOCAL (temp ret_temp (block_header_size_val h))
    SEP (block_header_at sh h p).


Definition certicoq_block__field_count_get_spec :=
  DECLARE _certicoq_block__field_count_get
  WITH
    h : BlockHeader,
    sh : share,
    p : val
  PRE [ tptr block_header_type ]
    PROP (readable_share sh)
    PARAMS (p)
    GLOBALS ()
    SEP (block_header_at sh h p)
  POST [ size_type ]
    PROP ()
    LOCAL (temp ret_temp (block_header_field_count_val h))
    SEP (block_header_at sh h p).


Definition certicoq_block__field_count_set_spec :=
  DECLARE _certicoq_block__field_count_set
  WITH
    h : BlockHeader,
    sh : share,
    p : val,
    z : {z: Z | 1 <= z < two_p (constants.word_size * 8 - 10)}
  PRE [ tptr block_header_type, size_type ]
    PROP (writable_share sh)
    PARAMS
      ( p
      ; if Archi.ptr64 then Vlong (Int64.repr (proj1_sig z)) else Vint (Int.repr (proj1_sig z))
      )
    GLOBALS ()
    SEP (block_header_at sh h p)
  POST [ tvoid ]
    PROP ()
    LOCAL ()
    SEP (block_header_at sh (block_header_field_count_set h (proj1_sig z) (proj2_sig z)) p).


Definition certicoq_block__tag_get_spec :=
  DECLARE _certicoq_block__tag_get
  WITH
    h : BlockHeader,
    sh : share,
    p : val
  PRE [ tptr block_header_type ]
    PROP (readable_share sh)
    PARAMS (p)
    GLOBALS ()
    SEP (block_header_at sh h p)
  POST [ tuchar ]
    PROP ()
    LOCAL (temp ret_temp (block_header_tag_val h))
    SEP (block_header_at sh h p).


Definition certicoq_block__tag_set_spec :=
  DECLARE _certicoq_block__tag_set
  WITH
    h : BlockHeader,
    sh : share,
    p : val,
    z : {z: Z | 0 <= z < 256}
  PRE [ tptr block_header_type, tuchar ]
    PROP (writable_share sh)
    PARAMS
      ( p
      ; Vint (Int.repr (proj1_sig z))
      )
    GLOBALS ()
    SEP (block_header_at sh h p)
  POST [ tvoid ]
    PROP ()
    LOCAL ()
    SEP (block_header_at sh (block_header_tag_set h (proj1_sig z) (proj2_sig z)) p).


Definition certicoq_block__odata_get_spec :=
  DECLARE _certicoq_block__odata_get
  WITH
    h : BlockHeader,
    sh : share,
    p : val
  PRE [ tptr block_header_type ]
    PROP (readable_share sh)
    PARAMS (p)
    GLOBALS ()
    SEP (block_header_at sh h p)
  POST [ tuchar ]
    PROP ()
    LOCAL (temp ret_temp (block_header_odata_val h))
    SEP (block_header_at sh h p).


Definition certicoq_block__odata_set_spec :=
  DECLARE _certicoq_block__odata_set
  WITH
    h : BlockHeader,
    sh : share,
    p : val,
    z : {z: Z | 0 <= z < 4}
  PRE [ tptr block_header_type, tuchar ]
    PROP (writable_share sh)
    PARAMS
      ( p
      ; Vint (Int.repr (proj1_sig z))
      )
    GLOBALS ()
    SEP (block_header_at sh h p)
  POST [ tvoid ]
    PROP ()
    LOCAL ()
    SEP (block_header_at sh (block_header_odata_set h (proj1_sig z) (proj2_sig z)) p).


(*
TODO:

int_or_ptr *certicoq_block__field_get_ptr(certicoq_block_t block, size_t field);
int_or_ptr certicoq_block__field_get(const certicoq_block_t block, size_t field);
void certicoq_block__field_set(certicoq_block_t block, size_t field, int_or_ptr x);
*)

Definition ASI: funspecs := ltac:(with_library prog
  [ certicoq_block__init_spec
  ; certicoq_block__size_get_spec
  ; certicoq_block__field_count_get_spec
  ; certicoq_block__field_count_set_spec
  ; certicoq_block__tag_get_spec
  ; certicoq_block__tag_set_spec
  ; certicoq_block__odata_get_spec
  ; certicoq_block__odata_set_spec
  ]).

From Coq Require Import Lists.List.

From VST Require Import floyd.proofauto.

From appliedfm Require Import int_or_ptr.vst.cmodel.val.
From appliedfm Require Import int_or_ptr.vst.spec.spec.

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

Definition field_index_val (field: Z): val
 := if Archi.ptr64
    then Vlong (Int64.repr field)
    else Vint (Int.repr field).

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

Definition undef_block_at (sh: share) (size: Z) (p: val):
  mpred
 := data_at sh (tarray int_or_ptr_type size) (repeat Vundef (Z.to_nat size)) p.


Definition certicoq_block__init_spec :=
  DECLARE _certicoq_block__init
  WITH
    h: BlockHeader,
    dst_sh: share,
    dst: val,
    header_sh: share,
    header: val
  PRE [ tptr int_or_ptr_type, tptr block_header_type ]
    PROP (writable_share dst_sh ; readable_share header_sh)
    PARAMS (dst ; header)
    GLOBALS ()
    SEP (block_header_at header_sh h header * undef_block_at dst_sh (block_header_size h) dst)
  POST [ tptr int_or_ptr_type ]
    PROP ()
    LOCAL (temp ret_temp (offset_val (sizeof block_header_type) dst))
    SEP (block_header_at header_sh h header * block_at dst_sh (block_init h) dst).

Definition certicoq_block__of_header_spec :=
  DECLARE _certicoq_block__of_header
  WITH
    b: Block,
    sh: share,
    header: val
  PRE [ tptr block_header_type ]
    PROP (isptr header)
    PARAMS (header)
    GLOBALS ()
    SEP (block_at sh b (offset_val (sizeof block_header_type) header))
  POST [ tptr int_or_ptr_type ]
    PROP ()
    LOCAL (temp ret_temp (offset_val (sizeof block_header_type) header))
    SEP (block_at sh b (offset_val (sizeof block_header_type) header)).

Definition certicoq_block__copy_spec :=
  DECLARE _certicoq_block__copy
  WITH
    b: Block,
    src_sh: share,
    dst_sh: share,
    dst: val,
    src: val
  PRE [ tptr int_or_ptr_type, tptr int_or_ptr_type ]
    PROP (writable_share dst_sh ; readable_share src_sh)
    PARAMS (dst ; src)
    GLOBALS ()
    SEP (undef_block_at dst_sh (block_header_size (block_header b)) dst * block_at src_sh b src)
  POST [ tptr int_or_ptr_type ]
    PROP ()
    LOCAL (temp ret_temp (offset_val (sizeof block_header_type) dst))
    SEP (block_at dst_sh b dst * block_at src_sh b src).

Definition certicoq_block__header_get_ptr_spec :=
  DECLARE _certicoq_block__header_get_ptr
  WITH
    b: Block,
    sh: share,
    block: val
  PRE [ tptr int_or_ptr_type ]
    PROP (isptr block)
    PARAMS (block)
    GLOBALS ()
    SEP (block_at sh b block)
  POST [ tptr block_header_type ]
    PROP ()
    LOCAL (temp ret_temp (offset_val (0 - sizeof block_header_type) block))
    SEP (block_at sh b block).

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

Definition certicoq_block__field_get_ptr_spec :=
  DECLARE _certicoq_block__field_get_ptr
  WITH
    b: Block,
    f: Z,
    sh: share,
    block: val,
    field: val
  PRE [ tptr int_or_ptr_type, size_type ]
    PROP (0 <= f <= block_header_field_count b ; isptr block ; field = field_index_val f)
    PARAMS (block ; field)
    GLOBALS ()
    SEP (block_at sh b block)
  POST [ tptr int_or_ptr_type ]
    PROP ()
    LOCAL (temp ret_temp (offset_val (sizeof int_or_ptr_type * f) block))
    SEP (block_at sh b block).

Definition iter_fun:
  type
 := tptr (Tfunction (Tcons (tptr tvoid) (Tcons (tptr tvoid) (Tcons (tptr int_or_ptr_type) Tnil))) tvoid cc_default).

Definition certicoq_block__field_iter_spec :=
  DECLARE _certicoq_block__field_iter
  WITH
    b: Block,
    sh: share,
    block : val,
    f: val,
    c_args: val,
    f_args: val
  PRE [ tptr int_or_ptr_type, iter_fun, tptr tvoid, tptr tvoid ]
    PROP (isptr block)
    PARAMS (block ; f ; c_args ; f_args)
    GLOBALS ()
    SEP (block_at sh b block)
  POST [ tvoid ]
    PROP ()
    LOCAL ()
    SEP (block_at sh b block).

Definition certicoq_block__field_ptr_iter_spec :=
  DECLARE _certicoq_block__field_ptr_iter
  WITH
    b: Block,
    sh: share,
    block : val,
    f: val,
    c_args: val,
    f_args: val
  PRE [ tptr int_or_ptr_type, iter_fun, tptr tvoid, tptr tvoid ]
    PROP (isptr block)
    PARAMS (block ; f ; c_args ; f_args)
    GLOBALS ()
    SEP (block_at sh b block)
  POST [ tvoid ]
    PROP ()
    LOCAL ()
    SEP (block_at sh b block).

Definition certicoq_block__tag_noscan_limit_spec :=
  DECLARE _certicoq_block__tag_noscan_limit
  WITH
    u: unit
  PRE [ ]
    PROP ()
    PARAMS ()
    GLOBALS ()
    SEP ()
  POST [ tuchar ]
    PROP ()
    LOCAL (temp ret_temp (Vint (Int.repr block_tag_noscan_limit)))
    SEP ().

Definition certicoq_block__tag_is_noscan_spec :=
  DECLARE _certicoq_block__tag_is_noscan
  WITH
    t: Z,
    tag: val
  PRE [ tuchar ]
    PROP (tag = Vint (Int.repr t))
    PARAMS (tag)
    GLOBALS ()
    SEP ()
  POST [ tint ]
    PROP ()
    LOCAL (temp ret_temp (Vint (Int.repr (if block_tag_is_noscan_dec t then 1 else 0))))
    SEP ().

Module certicoq_block__specs.
  Definition exports: funspecs :=
    [ certicoq_block__init_spec
    ; certicoq_block__of_header_spec
    ; certicoq_block__copy_spec
    ; certicoq_block__header_get_ptr_spec
    ; certicoq_block__size_get_spec
    ; certicoq_block__field_count_get_spec
    ; certicoq_block__field_count_set_spec
    ; certicoq_block__tag_get_spec
    ; certicoq_block__tag_set_spec
    ; certicoq_block__tag_noscan_limit_spec
    ; certicoq_block__tag_is_noscan_spec
    ; certicoq_block__odata_get_spec
    ; certicoq_block__odata_set_spec
    ; certicoq_block__field_get_ptr_spec
    ; certicoq_block__field_iter_spec
    ; certicoq_block__field_ptr_iter_spec
    ].
  Definition externs: funspecs := [].
  Definition imports: funspecs := [int_or_ptr__is_int_spec].
  Definition private: funspecs := [].
  Definition internals: funspecs := private ++ exports.
  Definition gprog: funspecs := imports ++ internals.
  Definition vprog: varspecs := ltac:(mk_varspecs prog).
End certicoq_block__specs.

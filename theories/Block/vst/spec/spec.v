From VST Require Import floyd.proofauto.

From appliedfm Require Import int_or_ptr.vst.cmodel.val.

From CertiCoq Require Import Block.vst.ast.ast.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block_header.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block.
From CertiCoq Require Import Block.vst.clightgen.block.


Definition theader: type
 := if Archi.ptr64
    then tulong
    else tuint.

Definition tsize_t: type
 := if Archi.ptr64
    then tulong
    else tuint.


Definition block_header_at (sh: share) (h: BlockHeader) (p: val):
  mpred
 := data_at sh (tarray theader 1) [block_header_encode_val h] p.


Definition certicoq_block__size_get_spec :=
  DECLARE _certicoq_block__size_get
  WITH
    h : BlockHeader,
    sh : share,
    p : val
  PRE [ tptr theader ]
    PROP (readable_share sh)
    PARAMS (p)
    GLOBALS ()
    SEP (block_header_at sh h p)
  POST [ tsize_t ]
    PROP ()
    LOCAL (temp ret_temp (block_header_size_val h))
    SEP (block_header_at sh h p).


Definition certicoq_block__field_count_get_spec :=
  DECLARE _certicoq_block__field_count_get
  WITH
    h : BlockHeader,
    sh : share,
    p : val
  PRE [ tptr theader ]
    PROP (readable_share sh)
    PARAMS (p)
    GLOBALS ()
    SEP (block_header_at sh h p)
  POST [ tsize_t ]
    PROP ()
    LOCAL (temp ret_temp (block_header_field_count_val h))
    SEP (block_header_at sh h p).


Definition certicoq_block__field_count_set_spec :=
  DECLARE _certicoq_block__field_count_set
  WITH
    h : BlockHeader,
    sh : share,
    p : val,
    z : {z: Z | 0 <= z < two_p (constants.word_size * 8 - 10)}
  PRE [ tptr theader, tsize_t ]
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
  PRE [ tptr theader ]
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
  PRE [ tptr theader, tuchar ]
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
  PRE [ tptr theader ]
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
  PRE [ tptr theader, tuchar ]
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


Definition ASI: funspecs := ltac:(with_library prog
  [ certicoq_block__size_get_spec
  ; certicoq_block__field_count_get_spec
  ; certicoq_block__field_count_set_spec
  ; certicoq_block__tag_get_spec
  ; certicoq_block__tag_set_spec
  ; certicoq_block__odata_get_spec
  ; certicoq_block__odata_set_spec
  ]).

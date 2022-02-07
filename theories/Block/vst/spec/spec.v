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

Definition certicoq_block__get_size_spec :=
  DECLARE _certicoq_block__get_size
  WITH
    h : BlockHeader,
    sh : share,
    p : val
  PRE [ tptr theader ]
    PROP (readable_share sh)
    PARAMS (p)
    GLOBALS ()
    SEP (data_at sh (tarray theader 1) [block_header_encode_val h] p)
  POST [ tsize_t ]
    PROP ()
    LOCAL (temp ret_temp (block_header_size_val h))
    SEP (data_at sh (tarray theader 1) [block_header_encode_val h] p).


Definition certicoq_block__get_field_count_spec :=
  DECLARE _certicoq_block__get_field_count
  WITH
    h : BlockHeader,
    sh : share,
    p : val
  PRE [ tptr theader ]
    PROP (readable_share sh)
    PARAMS (p)
    GLOBALS ()
    SEP (data_at sh (tarray theader 1) [block_header_encode_val h] p)
  POST [ tsize_t ]
    PROP ()
    LOCAL (temp ret_temp (block_header_field_count_val h))
    SEP (data_at sh (tarray theader 1) [block_header_encode_val h] p).


Definition certicoq_block__get_tag_spec :=
  DECLARE _certicoq_block__get_tag
  WITH
    h : BlockHeader,
    sh : share,
    p : val
  PRE [ tptr theader ]
    PROP (readable_share sh)
    PARAMS (p)
    GLOBALS ()
    SEP (data_at sh (tarray theader 1) [block_header_encode_val h] p)
  POST [ tuchar ]
    PROP ()
    LOCAL (temp ret_temp (block_header_tag_val h))
    SEP (data_at sh (tarray theader 1) [block_header_encode_val h] p).


Definition certicoq_block__get_odata_spec :=
  DECLARE _certicoq_block__get_odata
  WITH
    h : BlockHeader,
    sh : share,
    p : val
  PRE [ tptr theader ]
    PROP (readable_share sh)
    PARAMS (p)
    GLOBALS ()
    SEP (data_at sh (tarray theader 1) [block_header_encode_val h] p)
  POST [ tuchar ]
    PROP ()
    LOCAL (temp ret_temp (block_header_odata_val h))
    SEP (data_at sh (tarray theader 1) [block_header_encode_val h] p).


Definition ASI: funspecs := ltac:(with_library prog
  [ certicoq_block__get_size_spec
  ; certicoq_block__get_field_count_spec
  ; certicoq_block__get_tag_spec
  ; certicoq_block__get_odata_spec
  ]).

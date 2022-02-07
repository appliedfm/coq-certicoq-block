From VST Require Import floyd.proofauto.

From CertiCoq Require Import Block.vst.ast.ast.
From CertiCoq Require Import Block.vst.clightgen.block.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block_header.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block.
From CertiCoq Require Import Block.vst.spec.spec.

Lemma body: semax_body Vprog ASI f_certicoq_block__get_size certicoq_block__get_size_spec.
Proof.
  start_function.
  forward.
  forward.
  forward.
  forward_call.
  forward_if (
    PROP ()
    LOCAL (temp _t'2 (block_header_size_val h))
    SEP (data_at sh (tarray theader 1) [block_header_encode_val h] p)
  ).
  {
    forward.
    entailer!.
    unfold block_header_size_val.
    cbv [Archi.ptr64].
    unfold block_header_size.
    f_equal.
    f_equal.
    rewrite Int64.unsigned_repr in H.
    2: {
      split ; try lia.
      intro F.
      inversion F.
    }
    rewrite Int64.unsigned_repr in H by apply block_header_field_count__max.
    lia.
  }
  {
    forward.
    entailer!.
    unfold block_header_size_val.
    cbv [Archi.ptr64].
    unfold block_header_size.
    rewrite Int64.unsigned_repr in H.
    2: {
      split ; try lia.
      intro F.
      inversion F.
    }
    rewrite Int64.unsigned_repr in H by apply block_header_field_count__max.
    f_equal.
    f_equal.
    lia.
  }
  forward.
Qed.

From VST Require Import floyd.proofauto.

From CertiCoq Require Import Block.vst.ast.ast.
From CertiCoq Require Import Block.vst.clightgen.block.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block_header.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block.
From CertiCoq Require Import Block.vst.spec.spec.

Lemma body: semax_body Vprog ASI f_certicoq_block__get_field_count certicoq_block__get_field_count_spec.
Proof.
  start_function.
  forward.
  forward.
  entailer!.
  unfold block_header_field_count_val.
  cbv [Archi.ptr64].
  rewrite <- block_header_encode__block_header_field_count.
  unfold Int64.shru, Int.shru.
  first
    [ rewrite Int64.unsigned_repr by apply block_header_encode__max_unsigned
    | rewrite Int.unsigned_repr by apply block_header_encode__max_unsigned
    ].
  change (Int64.unsigned (Int64.repr 10)) with 10.
  change (Int.unsigned (Int.repr 10)) with 10.
  easy.
Qed.

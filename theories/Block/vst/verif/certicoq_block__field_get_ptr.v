From VST Require Import floyd.proofauto.

From CertiCoq Require Import Block.vst.ast.ast.
From CertiCoq Require Import Block.vst.clightgen.block.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block_header.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block.
From CertiCoq Require Import Block.vst.spec.spec.

Lemma body: semax_body Vprog ASI f_certicoq_block__field_get_ptr certicoq_block__field_get_ptr_spec.
Proof.
  start_function.
  forward.
  {
    entailer!.
    destruct block ; try contradiction.
    simpl.
    f_equal.
    f_equal.
    rewrite Ptrofs.mul_signed.
    f_equal.
    f_equal.
    admit.
  }
Admitted.

From VST Require Import floyd.proofauto.

From CertiCoq Require Import Block.vst.ast.ast.
From CertiCoq Require Import Block.vst.clightgen.block.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block_header.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block.
From CertiCoq Require Import Block.vst.spec.spec.

Lemma body: semax_body Vprog certicoq_block__specs.gprog f_certicoq_block__tag_is_noscan certicoq_block__tag_is_noscan_spec.
Proof.
  start_function.
  forward_call.
  forward_if.
  {
    forward.
    entailer!.
    destruct (block_tag_is_noscan_dec t) as [Hnoscan | Hnoscan] ; try reflexivity.
    exfalso.
    apply Hnoscan.
    unfold block_tag_is_noscan.
    apply negb_true_iff in H0.
    apply lt_repr_false in H0 ; try assumption.
    - admit.
    - now split.
  }
  {
    forward.
    entailer!.
    destruct (block_tag_is_noscan_dec t) as [Hnoscan | Hnoscan] ; try reflexivity.
    exfalso.
    apply negb_false_iff in H0.
    apply lt_repr in H0.
    - unfold block_tag_is_noscan in Hnoscan.
      lia.
    - admit.
    - now split.
  }
Admitted.

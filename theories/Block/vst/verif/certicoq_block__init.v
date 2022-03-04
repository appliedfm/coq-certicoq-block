From VST Require Import floyd.proofauto.

From CertiCoq Require Import Block.vst.ast.ast.
From CertiCoq Require Import Block.vst.clightgen.block.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block_header.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block.
From CertiCoq Require Import Block.vst.spec.spec.

Lemma body: semax_body Vprog certicoq_block__specs.all f_certicoq_block__init certicoq_block__init_spec.
Proof.
  start_function.
  unfold block_header_size, block_header_at, undef_block_at.
  Intros.
  forward.
  forward.
  forward.
  {
    entailer!.
    pose proof (block_header_field_count__range h) as HH1.
    lia.
  }
  forward.
  {
    entailer!.
    unfold block_at, block_header_at, block_fields_at.
    admit.
  }
Admitted.

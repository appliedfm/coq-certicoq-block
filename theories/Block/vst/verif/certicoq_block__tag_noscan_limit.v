From VST Require Import floyd.proofauto.

From CertiCoq Require Import Block.vst.ast.ast.
From CertiCoq Require Import Block.vst.clightgen.block.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block_header.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block.
From CertiCoq Require Import Block.vst.spec.spec.

Lemma body: semax_body Vprog ASI f_certicoq_block__tag_noscan_limit certicoq_block__tag_noscan_limit_spec.
Proof.
  start_function.
  forward.
Qed.

From VST Require Import floyd.proofauto.

From CertiCoq Require Import Block.vst.ast.ast.
From CertiCoq Require Import Block.vst.clightgen.block.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block_header.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block.
From CertiCoq Require Import Block.vst.spec.spec.

Lemma body: semax_body Vprog ASI f_certicoq_block__odata_set certicoq_block__odata_set_spec.
Proof.
  start_function.
  unfold block_header_at.
  forward.
  forward.
  forward.
  entailer!.
  clear.
  destruct z as [z Hz].
  cbv [upd_Znth].
  cbv [sublist].
  unfold block_header_odata_set, block_header_encode_val.
  simpl.
  admit.
Admitted.

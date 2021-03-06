From VST Require Import floyd.proofauto.

From CertiCoq Require Import Block.vst.ast.ast.
From CertiCoq Require Import Block.vst.clightgen.block.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block_header.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block.
From CertiCoq Require Import Block.vst.spec.spec.

Lemma body: semax_body Vprog certicoq_block__specs.gprog f_certicoq_block__field_count_set certicoq_block__field_count_set_spec.
Proof.
  start_function.
  unfold block_header_at.
  forward.
  forward.
  forward.
  entailer!.
  clear.
  cbv [upd_Znth].
  cbv [sublist].
  destruct z as [z Hz].
  unfold block_header_field_count_set, block_header_encode_val.
  simpl.
  admit.
Admitted.

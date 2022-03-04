From VST Require Import floyd.proofauto.

From CertiCoq Require Import Block.vst.ast.ast.
From CertiCoq Require Import Block.vst.clightgen.block.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block_header.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block.
From CertiCoq Require Import Block.vst.spec.spec.

Lemma body: semax_body Vprog certicoq_block__specs.all f_certicoq_block__tag_get certicoq_block__tag_get_spec.
Proof.
  start_function.
  unfold block_header_at.
  forward.
  forward.
  entailer!.
  unfold block_header_tag_val.
  rewrite block_header_encode__block_header_tag.
  try rewrite Int64.unsigned_repr by apply block_header_tag__Int64_max_unsigned.
  unfold Int.zero_ext.
  rewrite Int.unsigned_repr by apply block_header_tag__Int_max_unsigned.
  f_equal.
  f_equal.
  pose proof (block_header_tag__range h) as HH.
  remember (block_header_tag h) as z eqn:Ez.
  clear -HH.
  destruct z ; try lia ; try easy.
  do 9 (destruct p ; try easy).
Qed.

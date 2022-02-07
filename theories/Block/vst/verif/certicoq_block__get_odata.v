From VST Require Import floyd.proofauto.

From CertiCoq Require Import Block.vst.ast.ast.
From CertiCoq Require Import Block.vst.clightgen.block.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block_header.
From CertiCoq Require Import Block.vst.cmodel.certicoq_block.
From CertiCoq Require Import Block.vst.spec.spec.

Lemma body: semax_body Vprog ASI f_certicoq_block__get_odata certicoq_block__get_odata_spec.
Proof.
  start_function.
  forward.
  forward.
  entailer!.
  unfold block_header_odata_val.
  replace
    (Int.and (Int.shru (Int.repr (block_header_encode h)) (Int.repr 8)) (Int.repr 3))
    with (Int.repr (Z.land (Z.shiftr (block_header_encode h) 8) 3)).
  2: {
    admit.
  }
  replace
    (Int64.unsigned (Int64.and (Int64.shru (Int64.repr (block_header_encode h)) (Int64.repr 8)) (Int64.repr 3)))
    with (Z.land (Z.shiftr (block_header_encode h) 8) 3).
  2: {
    admit.
  }
  rewrite block_header_encode__block_header_odata.
  f_equal.
  pose proof (block_header_odata__range h) as HH.
  remember (block_header_odata h) as z eqn:Ez.
  clear -HH.
  destruct z ; try lia ; try easy.
  do 3 (destruct p ; try easy).
Admitted.

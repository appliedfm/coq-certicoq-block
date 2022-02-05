From Coq Require Import ZArith.ZArith.

From compcert Require Import common.Values.
From compcert Require Import lib.Integers.

From VST Require Import floyd.sublist.
From VST Require Import veric.val_lemmas.

From CertiCoq Require Import Block.model.block.

From appliedfm Require Import int_or_ptr.vst.cmodel.constants.


Definition certicoq_block (odata: Type) := block word_size odata {x: val | isptr x}.


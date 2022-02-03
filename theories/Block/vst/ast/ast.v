From VST Require Import floyd.proofauto.
From VST Require Import floyd.library.
From CertiCoq Require Import Block.vst.clightgen.block.

#[global]Instance CompSpecs : compspecs. make_compspecs prog. Defined.
Definition Vprog : varspecs. mk_varspecs prog. Defined.

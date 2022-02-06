From Coq Require Import ZArith.ZArith.

From compcert Require Import common.Values.
From compcert Require Import lib.Integers.

From VST Require Import floyd.sublist.
From VST Require Import veric.val_lemmas.

From appliedfm Require Import int_or_ptr.vst.cmodel.constants.
From appliedfm Require Import int_or_ptr.vst.cmodel.val.


Record header :=
{
  header_tag: Z;
  header_size: Z;
  header_tag__range: (0 <= header_tag < 256)%Z;
}.

Record block (odata: Type) := {
    block_header: header;
    block_odata: odata;
    block_fields: list int_or_ptr;
    block_fields__range: (0 < Zlength block_fields < two_p (word_size * 8 - 10))%Z;
}.

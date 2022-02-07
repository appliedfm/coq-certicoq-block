From Coq Require Import Lists.List.
From Coq Require Import micromega.Lia.
From Coq Require Import ZArith.ZArith.

From appliedfm Require Import int_or_ptr.vst.cmodel.constants.
From appliedfm Require Import int_or_ptr.vst.cmodel.val.

From CertiCoq Require Import Block.vst.cmodel.certicoq_block_header.

Local Open Scope Z.

Record Block := {
  block_header:> BlockHeader;
  block_fields: list int_or_ptr;
  block_fields__block_header_field_count: Zlength block_fields = block_header_field_count block_header;
}.

Program Definition block_init (h: BlockHeader):
  Block
 := {|
  block_header := h;
  block_fields := repeat None (Z.to_nat (block_header_field_count h));
  block_fields__block_header_field_count := _;
|}.
Next Obligation.
  intros h.
  pose proof (block_header_field_count__range h) as HH1.
  now rewrite sublist.Zlength_repeat by lia.
Qed.

Lemma block_fields__Zlength (b: Block):
    1 <= Zlength (block_fields b) < two_p (word_size * 8 - 10).
Proof.
    rewrite block_fields__block_header_field_count.
    apply block_header_field_count__range.
Qed.

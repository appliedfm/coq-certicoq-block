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

Lemma block_fields__Zlength (b: Block):
    0 <= Zlength (block_fields b) < two_p (word_size * 8 - 10).
Proof.
    rewrite block_fields__block_header_field_count.
    apply block_header_field_count__range.
Qed.

Definition block_size (b: Block): Z
 := match block_fields b with
    | nil => 2
    | _ => 1 + Zlength (block_fields b)
    end.

Lemma block_size__eq (b: Block):
    block_size b = Z.max 2 (1 + Zlength (block_fields b)).
Proof.
    unfold block_size.
    remember (block_fields b) as ff eqn:Eff.
    destruct ff as [|f ff] ; try easy.
    pose proof (sublist.Zlength_nonneg ff) as H1.
    rewrite Zlength_cons.
    lia.
Qed.

Lemma block_size__lower_bound (b: Block):
    2 <= block_size b.
Proof.
    rewrite block_size__eq.
    lia.
Qed.

Lemma block_size__block_fields (b: Block):
    1 + Zlength (block_fields b) <= block_size b <= 2 + Zlength (block_fields b).
Proof.
    rewrite block_size__eq.
    remember (block_fields b) as ff eqn:Eff.
    pose proof (sublist.Zlength_nonneg ff).
    lia.
Qed.

From Coq Require Import micromega.Lia.
From Coq Require Import ZArith.ZArith.

From compcert Require Import common.Values.
From compcert Require Import lib.Integers.

From appliedfm Require Import int_or_ptr.vst.cmodel.constants.
From appliedfm Require Import int_or_ptr.vst.cmodel.val.

Local Open Scope Z.

Definition block_tag_noscan_limit: Z := 251.

Definition block_tag_is_noscan (tag: Z): Prop := tag >= block_tag_noscan_limit.

Definition block_tag_is_noscan_dec (tag: Z):
  {block_tag_is_noscan tag} + {~ block_tag_is_noscan tag}
 := Z_ge_dec tag block_tag_noscan_limit.

Record BlockHeader :=
{
  block_header_field_count: Z;
  block_header_tag: Z;
  block_header_odata: Z;
  block_header_field_count__range: 1 <= block_header_field_count < two_p (word_size * 8 - 10);
  block_header_tag__range: 0 <= block_header_tag < 256;
  block_header_odata__range: 0 <= block_header_odata < 4;
}.

Definition block_header_field_count_set (h: BlockHeader) (z: Z)
  (Hz: 1 <= z < two_p (word_size * 8 - 10)):
  BlockHeader
 := {|
  block_header_field_count := z;
  block_header_tag := block_header_tag h;
  block_header_odata := block_header_odata h;
  block_header_field_count__range := Hz;
  block_header_tag__range := block_header_tag__range h;
  block_header_odata__range := block_header_odata__range h;
|}.

Definition block_header_tag_set (h: BlockHeader) (z: Z)
  (Hz: 0 <= z < 256):
  BlockHeader
 := {|
  block_header_field_count := block_header_field_count h;
  block_header_tag := z;
  block_header_odata := block_header_odata h;
  block_header_field_count__range := block_header_field_count__range h;
  block_header_tag__range := Hz;
  block_header_odata__range := block_header_odata__range h;
|}.

Definition block_header_odata_set (h: BlockHeader) (z: Z)
  (Hz: 0 <= z < 4):
  BlockHeader
 := {|
  block_header_field_count := block_header_field_count h;
  block_header_tag := block_header_tag h;
  block_header_odata := z;
  block_header_field_count__range := block_header_field_count__range h;
  block_header_tag__range := block_header_tag__range h;
  block_header_odata__range := Hz;
|}.

Lemma block_header_field_count__max (h: BlockHeader):
  0 <= block_header_field_count h <= if Archi.ptr64 then Int64.max_unsigned else Int.max_unsigned.
Proof.
  admit.
Admitted.


Lemma block_header_tag__Int_max_unsigned (h: BlockHeader):
  0 <= block_header_tag h <= Int.max_unsigned.
Proof.
  admit.
Admitted.

Lemma block_header_tag__Int64_max_unsigned (h: BlockHeader):
  0 <= block_header_tag h <= Int64.max_unsigned.
Proof.
  pose proof (block_header_tag__Int_max_unsigned h) as HH1.
  split ; try lia.
  transitivity Int.max_unsigned ; try lia.
  intro F.
  inversion F.
Qed.


Lemma block_header_odata__max_unsigned (h: BlockHeader):
  0 <= block_header_odata h <= Int.max_unsigned.
Proof.
  admit.
Admitted.


Definition block_header_field_count_val (h: BlockHeader): val
 := if Archi.ptr64
    then Vlong (Int64.repr (block_header_field_count h))
    else Vint (Int.repr (block_header_field_count h)).

Definition block_header_tag_val (h: BlockHeader): val
 := Vint (Int.repr (block_header_tag h)).

Definition block_header_odata_val (h: BlockHeader): val
 := Vint (Int.repr (block_header_odata h)).

Definition block_header_size (h: BlockHeader): Z
 := 1 + block_header_field_count h.


Definition block_header_size_val (h: BlockHeader): val
 := if Archi.ptr64
    then Vlong (Int64.repr (block_header_size h))
    else Vint (Int.repr (block_header_size h)).


Definition block_header_field_count_encode (h: BlockHeader): Z
 := Z.shiftl (block_header_field_count h) 10.


Definition block_header_tag_encode (h: BlockHeader): Z
 := block_header_tag h.


Definition block_header_encode (h: BlockHeader): Z
 := Z.lor
      (Z.lor (block_header_field_count_encode h) (block_header_tag_encode h))
      (Z.shiftl (block_header_odata h) 8).


Lemma block_header_encode__max_unsigned (h: BlockHeader):
  0 <= block_header_encode h <= if Archi.ptr64 then Int64.max_unsigned else Int.max_unsigned.
Proof.
  admit.
Admitted.


Definition block_header_encode_val (h: BlockHeader): val
 := if Archi.ptr64
    then Vlong (Int64.repr (block_header_encode h))
    else Vint (Int.repr (block_header_encode h)).



Lemma block_header_tag_encode__shiftr (h: BlockHeader) (x: Z) (Hx: 0 <= x):
  Z.shiftr (block_header_tag_encode h) (8 + x) = 0.
Proof.
  rewrite <- Z.shiftr_shiftr by easy.
  replace
    (Z.shiftr (block_header_tag_encode h) 8)
    with 0.
  2: {
    unfold block_header_tag_encode.
    pose proof (block_header_tag__range h) as H1.
    remember (block_header_tag h) as z eqn:Ez.
    clear -H1.
    destruct z ; try lia ; try easy.
    do 9 (destruct p ; try easy).
  }
  apply Z.shiftr_0_l.
Qed.

Lemma block_header_encode__block_header_field_count (h: BlockHeader):
  Z.shiftr (block_header_encode h) 10 = block_header_field_count h.
Proof.
  unfold block_header_encode.
  repeat rewrite Z.shiftr_lor.
  rewrite Z.shiftr_shiftl_l by lia.
  replace (8-10) with (-2) by lia.
  replace
    (Z.shiftl (block_header_odata h) (-2))
    with 0.
  2: {
    pose proof (block_header_odata__range h) as H1.
    remember (block_header_odata h) as z eqn:Ez.
    clear -H1.
    destruct z ; try lia ; try easy.
    do 3 (destruct p ; try easy).
  }
  rewrite Z.lor_0_r.
  replace
    (Z.shiftr (block_header_tag_encode h) 10)
    with 0.
  2: {
    replace 10 with (8 + 2) by lia.
    symmetry.
    apply block_header_tag_encode__shiftr.
    lia.
  }
  rewrite Z.lor_0_r.
  unfold block_header_field_count_encode.
  rewrite Z.shiftr_shiftl_l by lia.
  now replace (10 - 10) with 0 by lia.
Qed.


Lemma block_header_encode__block_header_tag (h: BlockHeader):
  Z.land (block_header_encode h) 255 = block_header_tag h.
Proof.
  unfold block_header_encode.
  rewrite Z.land_lor_distr_l.
  replace
    (Z.land (Z.shiftl (block_header_odata h) 8) 255)
    with 0.
  2: {
    pose proof (block_header_odata__range h) as H1.
    remember (block_header_odata h) as z eqn:Ez.
    clear -H1.
    destruct z ; try lia ; try easy.
  }
  rewrite Z.lor_0_r.
  rewrite Z.land_lor_distr_l.
  replace
    (Z.land (block_header_field_count_encode h) 255)
    with 0.
  2: {
    unfold block_header_field_count_encode.
    remember (block_header_field_count h) as z eqn:Ez.
    clear.
    destruct z ; try lia ; try easy.
  }
  rewrite Z.lor_0_l.
  unfold block_header_tag_encode.
  pose proof (block_header_tag__range h).
  remember (block_header_tag h) as z eqn:Ez.
  destruct z ; try lia ; try easy.
  do 9 (destruct p ; try easy).
Qed.


Lemma block_header_encode__block_header_odata (h: BlockHeader):
  Z.land (Z.shiftr (block_header_encode h) 8) 3 = block_header_odata h.
Proof.
  unfold block_header_encode.
  repeat rewrite Z.shiftr_lor.
  replace
    (Z.shiftr (block_header_tag_encode h) 8)
    with 0.
  2: {
    replace 8 with (8 + 0) by lia.
    symmetry.
    apply block_header_tag_encode__shiftr.
    lia.
  }
  rewrite Z.lor_0_r.
  rewrite Z.land_lor_distr_l.
  replace
    (Z.land (Z.shiftr (block_header_field_count_encode h) 8) 3)
    with 0.
  2: {
    unfold block_header_field_count_encode.
    rewrite Z.shiftr_shiftl_l by lia.
    replace (10 - 8) with 2 by lia.
    pose proof (block_header_field_count__range h).
    remember (block_header_field_count h) as z eqn:Ez.
    now destruct z.
  }
  rewrite Z.lor_0_l.
  rewrite Z.shiftr_shiftl_l by lia.
  replace (8 - 8) with 0 by lia.
  pose proof (block_header_odata__range h) as H1.
  remember (block_header_odata h) as z eqn:Ez.
  clear -H1.
  destruct z ; try lia ; try easy.
  do 3 (destruct p ; try easy).
Qed.

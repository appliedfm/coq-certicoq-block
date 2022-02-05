From Coq Require Import ZArith.ZArith.

From appliedfm Require Import int_or_ptr.model.int_or_ptr.

Record header :=
{
  header_tag: Z;
  header_size: Z;
  header_tag__range: (0 <= header_tag < 256)%Z;
}.

Record block (word_size: Z) (header_odata: Type) (X: Type) := {
    block_header: header;
    block_header_odata: header_odata;
    block_fields: list (int_or_ptr X);
    block_fields__range: (0 < Zlength block_fields < two_p (word_size * 8 - 10))%Z;
}.

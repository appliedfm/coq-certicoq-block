From VST Require Import floyd.proofauto.
From VST Require Import floyd.VSU.

From CertiCoq Require Import Block.vst.clightgen.block.
From CertiCoq Require Import Block.vst.spec.spec.
From CertiCoq Require Import Block.vst.verif.certicoq_block__copy.
From CertiCoq Require Import Block.vst.verif.certicoq_block__field_count_get.
From CertiCoq Require Import Block.vst.verif.certicoq_block__field_count_set.
From CertiCoq Require Import Block.vst.verif.certicoq_block__field_get_ptr.
From CertiCoq Require Import Block.vst.verif.certicoq_block__field_iter.
From CertiCoq Require Import Block.vst.verif.certicoq_block__field_ptr_iter.
From CertiCoq Require Import Block.vst.verif.certicoq_block__header_get_ptr.
From CertiCoq Require Import Block.vst.verif.certicoq_block__init.
From CertiCoq Require Import Block.vst.verif.certicoq_block__odata_get.
From CertiCoq Require Import Block.vst.verif.certicoq_block__odata_set.
From CertiCoq Require Import Block.vst.verif.certicoq_block__of_header.
From CertiCoq Require Import Block.vst.verif.certicoq_block__size_get.
From CertiCoq Require Import Block.vst.verif.certicoq_block__tag_get.
From CertiCoq Require Import Block.vst.verif.certicoq_block__tag_is_noscan.
From CertiCoq Require Import Block.vst.verif.certicoq_block__tag_noscan_limit.
From CertiCoq Require Import Block.vst.verif.certicoq_block__tag_set.

#[local] Existing Instance NullExtension.Espec.

Definition certicoq_block__vsu:
  VSU
    certicoq_block__specs.externs
    certicoq_block__specs.imports
    ltac:(QPprog prog)
    certicoq_block__specs.exports
    emp.
Proof.
  mkVSU prog certicoq_block__specs.internals.
  - solve_SF_internal certicoq_block__init.body.
  - solve_SF_internal certicoq_block__of_header.body.
  - solve_SF_internal certicoq_block__copy.body.
  - solve_SF_internal certicoq_block__header_get_ptr.body.
  - solve_SF_internal certicoq_block__size_get.body.
  - solve_SF_internal certicoq_block__field_count_get.body.
  - solve_SF_internal certicoq_block__field_count_set.body.
  - solve_SF_internal certicoq_block__tag_get.body.
  - solve_SF_internal certicoq_block__tag_set.body.
  - solve_SF_internal certicoq_block__tag_noscan_limit.body.
  - solve_SF_internal certicoq_block__tag_is_noscan.body.
  - solve_SF_internal certicoq_block__odata_get.body.
  - solve_SF_internal certicoq_block__odata_set.body.
  - solve_SF_internal certicoq_block__field_get_ptr.body.
  - solve_SF_internal certicoq_block__field_iter.body.
  - solve_SF_internal certicoq_block__field_ptr_iter.body.
Defined.

(* Eval cbv in map (fun x => string_of_ident (fst x)) (VSU_Exports certicoq_block__vsu). *)

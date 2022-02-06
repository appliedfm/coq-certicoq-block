From Coq Require Import String List ZArith.
From compcert Require Import Coqlib Integers Floats AST Ctypes Cop Clight Clightdefs.
Import Clightdefs.ClightNotations.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope clight_scope.

Module Info.
  Definition version := "3.9".
  Definition build_number := "".
  Definition build_tag := "".
  Definition build_branch := "".
  Definition arch := "x86".
  Definition model := "32sse2".
  Definition abi := "standard".
  Definition bitsize := 32.
  Definition big_endian := false.
  Definition source_file := "src/c/include/coq-vsu-certicoq-block/src/block.c".
  Definition normalized := true.
End Info.

Definition ___builtin_ais_annot : ident := $"__builtin_ais_annot".
Definition ___builtin_annot : ident := $"__builtin_annot".
Definition ___builtin_annot_intval : ident := $"__builtin_annot_intval".
Definition ___builtin_bswap : ident := $"__builtin_bswap".
Definition ___builtin_bswap16 : ident := $"__builtin_bswap16".
Definition ___builtin_bswap32 : ident := $"__builtin_bswap32".
Definition ___builtin_bswap64 : ident := $"__builtin_bswap64".
Definition ___builtin_clz : ident := $"__builtin_clz".
Definition ___builtin_clzl : ident := $"__builtin_clzl".
Definition ___builtin_clzll : ident := $"__builtin_clzll".
Definition ___builtin_ctz : ident := $"__builtin_ctz".
Definition ___builtin_ctzl : ident := $"__builtin_ctzl".
Definition ___builtin_ctzll : ident := $"__builtin_ctzll".
Definition ___builtin_debug : ident := $"__builtin_debug".
Definition ___builtin_expect : ident := $"__builtin_expect".
Definition ___builtin_fabs : ident := $"__builtin_fabs".
Definition ___builtin_fabsf : ident := $"__builtin_fabsf".
Definition ___builtin_fmadd : ident := $"__builtin_fmadd".
Definition ___builtin_fmax : ident := $"__builtin_fmax".
Definition ___builtin_fmin : ident := $"__builtin_fmin".
Definition ___builtin_fmsub : ident := $"__builtin_fmsub".
Definition ___builtin_fnmadd : ident := $"__builtin_fnmadd".
Definition ___builtin_fnmsub : ident := $"__builtin_fnmsub".
Definition ___builtin_fsqrt : ident := $"__builtin_fsqrt".
Definition ___builtin_membar : ident := $"__builtin_membar".
Definition ___builtin_memcpy_aligned : ident := $"__builtin_memcpy_aligned".
Definition ___builtin_read16_reversed : ident := $"__builtin_read16_reversed".
Definition ___builtin_read32_reversed : ident := $"__builtin_read32_reversed".
Definition ___builtin_sel : ident := $"__builtin_sel".
Definition ___builtin_sqrt : ident := $"__builtin_sqrt".
Definition ___builtin_unreachable : ident := $"__builtin_unreachable".
Definition ___builtin_va_arg : ident := $"__builtin_va_arg".
Definition ___builtin_va_copy : ident := $"__builtin_va_copy".
Definition ___builtin_va_end : ident := $"__builtin_va_end".
Definition ___builtin_va_start : ident := $"__builtin_va_start".
Definition ___builtin_write16_reversed : ident := $"__builtin_write16_reversed".
Definition ___builtin_write32_reversed : ident := $"__builtin_write32_reversed".
Definition ___compcert_i64_dtos : ident := $"__compcert_i64_dtos".
Definition ___compcert_i64_dtou : ident := $"__compcert_i64_dtou".
Definition ___compcert_i64_sar : ident := $"__compcert_i64_sar".
Definition ___compcert_i64_sdiv : ident := $"__compcert_i64_sdiv".
Definition ___compcert_i64_shl : ident := $"__compcert_i64_shl".
Definition ___compcert_i64_shr : ident := $"__compcert_i64_shr".
Definition ___compcert_i64_smod : ident := $"__compcert_i64_smod".
Definition ___compcert_i64_smulh : ident := $"__compcert_i64_smulh".
Definition ___compcert_i64_stod : ident := $"__compcert_i64_stod".
Definition ___compcert_i64_stof : ident := $"__compcert_i64_stof".
Definition ___compcert_i64_udiv : ident := $"__compcert_i64_udiv".
Definition ___compcert_i64_umod : ident := $"__compcert_i64_umod".
Definition ___compcert_i64_umulh : ident := $"__compcert_i64_umulh".
Definition ___compcert_i64_utod : ident := $"__compcert_i64_utod".
Definition ___compcert_i64_utof : ident := $"__compcert_i64_utof".
Definition ___compcert_va_composite : ident := $"__compcert_va_composite".
Definition ___compcert_va_float64 : ident := $"__compcert_va_float64".
Definition ___compcert_va_int32 : ident := $"__compcert_va_int32".
Definition ___compcert_va_int64 : ident := $"__compcert_va_int64".
Definition _block : ident := $"block".
Definition _certicoq_block__copy : ident := $"certicoq_block__copy".
Definition _certicoq_block__get_field : ident := $"certicoq_block__get_field".
Definition _certicoq_block__get_field_count : ident := $"certicoq_block__get_field_count".
Definition _certicoq_block__get_field_ptr : ident := $"certicoq_block__get_field_ptr".
Definition _certicoq_block__get_header_ptr : ident := $"certicoq_block__get_header_ptr".
Definition _certicoq_block__get_odata : ident := $"certicoq_block__get_odata".
Definition _certicoq_block__get_size : ident := $"certicoq_block__get_size".
Definition _certicoq_block__get_tag : ident := $"certicoq_block__get_tag".
Definition _certicoq_block__init : ident := $"certicoq_block__init".
Definition _certicoq_block__of_header : ident := $"certicoq_block__of_header".
Definition _certicoq_block__set_field : ident := $"certicoq_block__set_field".
Definition _certicoq_block__set_field_count : ident := $"certicoq_block__set_field_count".
Definition _certicoq_block__set_header : ident := $"certicoq_block__set_header".
Definition _certicoq_block__set_odata : ident := $"certicoq_block__set_odata".
Definition _certicoq_block__set_tag : ident := $"certicoq_block__set_tag".
Definition _dst : ident := $"dst".
Definition _f : ident := $"f".
Definition _field : ident := $"field".
Definition _field_count : ident := $"field_count".
Definition _hd : ident := $"hd".
Definition _header : ident := $"header".
Definition _i : ident := $"i".
Definition _int_or_ptr__of_int : ident := $"int_or_ptr__of_int".
Definition _main : ident := $"main".
Definition _odata : ident := $"odata".
Definition _ret : ident := $"ret".
Definition _size : ident := $"size".
Definition _src : ident := $"src".
Definition _tag : ident := $"tag".
Definition _x : ident := $"x".
Definition _t'1 : ident := 128%positive.
Definition _t'2 : ident := 129%positive.
Definition _t'3 : ident := 130%positive.
Definition _t'4 : ident := 131%positive.

Definition f_certicoq_block__init := {|
  fn_return := (tptr (talignas 2%N (tptr tvoid)));
  fn_callconv := cc_default;
  fn_params := ((_dst, (tptr (talignas 2%N (tptr tvoid)))) ::
                (_header, (tptr tuint)) :: nil);
  fn_vars := nil;
  fn_temps := ((_ret, (tptr (talignas 2%N (tptr tvoid)))) :: nil);
  fn_body :=
(Ssequence
  (Sset _ret
    (Ebinop Oadd (Etempvar _dst (tptr (talignas 2%N (tptr tvoid))))
      (Econst_int (Int.repr 1) tint) (tptr (talignas 2%N (tptr tvoid)))))
  (Ssequence
    (Scall None
      (Evar _certicoq_block__set_header (Tfunction
                                          (Tcons
                                            (tptr (talignas 2%N (tptr tvoid)))
                                            (Tcons (tptr tuint) Tnil)) tvoid
                                          cc_default))
      ((Etempvar _ret (tptr (talignas 2%N (tptr tvoid)))) ::
       (Etempvar _header (tptr tuint)) :: nil))
    (Sreturn (Some (Etempvar _ret (tptr (talignas 2%N (tptr tvoid))))))))
|}.

Definition f_certicoq_block__of_header := {|
  fn_return := (tptr (talignas 2%N (tptr tvoid)));
  fn_callconv := cc_default;
  fn_params := ((_header, (tptr tuint)) :: nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Sreturn (Some (Ebinop Oadd
                 (Ecast (Etempvar _header (tptr tuint))
                   (tptr (talignas 2%N (tptr tvoid))))
                 (Econst_int (Int.repr 1) tint)
                 (tptr (talignas 2%N (tptr tvoid))))))
|}.

Definition f_certicoq_block__copy := {|
  fn_return := (tptr (talignas 2%N (tptr tvoid)));
  fn_callconv := cc_default;
  fn_params := ((_dst, (tptr (talignas 2%N (tptr tvoid)))) ::
                (_src, (tptr (talignas 2%N (tptr tvoid)))) :: nil);
  fn_vars := nil;
  fn_temps := ((_hd, (tptr tuint)) ::
               (_ret, (tptr (talignas 2%N (tptr tvoid)))) ::
               (_field_count, tuint) :: (_i, tuint) ::
               (_f, (talignas 2%N (tptr tvoid))) ::
               (_t'4, (talignas 2%N (tptr tvoid))) :: (_t'3, tuint) ::
               (_t'2, (tptr (talignas 2%N (tptr tvoid)))) ::
               (_t'1, (tptr tuint)) :: nil);
  fn_body :=
(Ssequence
  (Ssequence
    (Scall (Some _t'1)
      (Evar _certicoq_block__get_header_ptr (Tfunction
                                              (Tcons
                                                (tptr (talignas 2%N (tptr tvoid)))
                                                Tnil) (tptr tuint)
                                              cc_default))
      ((Etempvar _src (tptr (talignas 2%N (tptr tvoid)))) :: nil))
    (Sset _hd (Etempvar _t'1 (tptr tuint))))
  (Ssequence
    (Ssequence
      (Scall (Some _t'2)
        (Evar _certicoq_block__init (Tfunction
                                      (Tcons
                                        (tptr (talignas 2%N (tptr tvoid)))
                                        (Tcons (tptr tuint) Tnil))
                                      (tptr (talignas 2%N (tptr tvoid)))
                                      cc_default))
        ((Etempvar _dst (tptr (talignas 2%N (tptr tvoid)))) ::
         (Etempvar _hd (tptr tuint)) :: nil))
      (Sset _ret (Etempvar _t'2 (tptr (talignas 2%N (tptr tvoid))))))
    (Ssequence
      (Ssequence
        (Scall (Some _t'3)
          (Evar _certicoq_block__get_field_count (Tfunction
                                                   (Tcons (tptr tuint) Tnil)
                                                   tuint cc_default))
          ((Etempvar _hd (tptr tuint)) :: nil))
        (Sset _field_count (Etempvar _t'3 tuint)))
      (Ssequence
        (Ssequence
          (Sset _i (Econst_int (Int.repr 0) tint))
          (Sloop
            (Ssequence
              (Sifthenelse (Ebinop Olt (Etempvar _i tuint)
                             (Etempvar _field_count tuint) tint)
                Sskip
                Sbreak)
              (Ssequence
                (Ssequence
                  (Scall (Some _t'4)
                    (Evar _certicoq_block__get_field (Tfunction
                                                       (Tcons
                                                         (tptr (talignas 2%N (tptr tvoid)))
                                                         (Tcons tuint Tnil))
                                                       (talignas 2%N (tptr tvoid))
                                                       cc_default))
                    ((Etempvar _src (tptr (talignas 2%N (tptr tvoid)))) ::
                     (Etempvar _i tuint) :: nil))
                  (Sset _f (Etempvar _t'4 (talignas 2%N (tptr tvoid)))))
                (Scall None
                  (Evar _certicoq_block__set_field (Tfunction
                                                     (Tcons
                                                       (tptr (talignas 2%N (tptr tvoid)))
                                                       (Tcons tuint
                                                         (Tcons
                                                           (talignas 2%N (tptr tvoid))
                                                           Tnil))) tvoid
                                                     cc_default))
                  ((Etempvar _ret (tptr (talignas 2%N (tptr tvoid)))) ::
                   (Etempvar _i tuint) ::
                   (Etempvar _f (talignas 2%N (tptr tvoid))) :: nil))))
            (Sset _i
              (Ebinop Oadd (Etempvar _i tuint) (Econst_int (Int.repr 1) tint)
                tuint))))
        (Sreturn (Some (Etempvar _ret (tptr (talignas 2%N (tptr tvoid))))))))))
|}.

Definition f_certicoq_block__get_header_ptr := {|
  fn_return := (tptr tuint);
  fn_callconv := cc_default;
  fn_params := ((_block, (tptr (talignas 2%N (tptr tvoid)))) :: nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Sreturn (Some (Ecast
                 (Ebinop Oadd
                   (Etempvar _block (tptr (talignas 2%N (tptr tvoid))))
                   (Eunop Oneg (Econst_int (Int.repr 1) tint) tint)
                   (tptr (talignas 2%N (tptr tvoid)))) (tptr tuint))))
|}.

Definition f_certicoq_block__set_header := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_block, (tptr (talignas 2%N (tptr tvoid)))) ::
                (_header, (tptr tuint)) :: nil);
  fn_vars := nil;
  fn_temps := ((_t'1, (talignas 2%N (tptr tvoid))) :: (_t'2, tuint) :: nil);
  fn_body :=
(Ssequence
  (Ssequence
    (Sset _t'2 (Ederef (Etempvar _header (tptr tuint)) tuint))
    (Scall (Some _t'1)
      (Evar _int_or_ptr__of_int (Tfunction (Tcons tint Tnil)
                                  (talignas 2%N (tptr tvoid)) cc_default))
      ((Etempvar _t'2 tuint) :: nil)))
  (Sassign
    (Ederef
      (Ebinop Oadd (Etempvar _block (tptr (talignas 2%N (tptr tvoid))))
        (Eunop Oneg (Econst_int (Int.repr 1) tint) tint)
        (tptr (talignas 2%N (tptr tvoid)))) (talignas 2%N (tptr tvoid)))
    (Etempvar _t'1 (talignas 2%N (tptr tvoid)))))
|}.

Definition f_certicoq_block__get_size := {|
  fn_return := tuint;
  fn_callconv := cc_default;
  fn_params := ((_header, (tptr tuint)) :: nil);
  fn_vars := nil;
  fn_temps := ((_t'1, tuint) :: nil);
  fn_body :=
(Ssequence
  (Scall (Some _t'1)
    (Evar _certicoq_block__get_field_count (Tfunction
                                             (Tcons (tptr tuint) Tnil) tuint
                                             cc_default))
    ((Etempvar _header (tptr tuint)) :: nil))
  (Sreturn (Some (Ebinop Oadd (Econst_int (Int.repr 1) tint)
                   (Etempvar _t'1 tuint) tuint))))
|}.

Definition f_certicoq_block__get_field_count := {|
  fn_return := tuint;
  fn_callconv := cc_default;
  fn_params := ((_header, (tptr tuint)) :: nil);
  fn_vars := nil;
  fn_temps := ((_t'1, tuint) :: nil);
  fn_body :=
(Ssequence
  (Sset _t'1 (Ederef (Etempvar _header (tptr tuint)) tuint))
  (Sreturn (Some (Ebinop Oshr (Etempvar _t'1 tuint)
                   (Econst_int (Int.repr 10) tint) tuint))))
|}.

Definition f_certicoq_block__set_field_count := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_header, (tptr tuint)) :: (_size, tuint) :: nil);
  fn_vars := nil;
  fn_temps := ((_t'1, tuint) :: nil);
  fn_body :=
(Ssequence
  (Sset _t'1 (Ederef (Etempvar _header (tptr tuint)) tuint))
  (Sassign (Ederef (Etempvar _header (tptr tuint)) tuint)
    (Ebinop Oor
      (Ebinop Oand (Etempvar _t'1 tuint)
        (Eunop Onotint
          (Ebinop Osub
            (Ebinop Oshl (Econst_int (Int.repr 1) tint)
              (Econst_int (Int.repr 10) tint) tint)
            (Econst_int (Int.repr 1) tint) tint) tint) tuint)
      (Ebinop Oshl (Etempvar _size tuint) (Econst_int (Int.repr 10) tint)
        tuint) tuint)))
|}.

Definition f_certicoq_block__get_tag := {|
  fn_return := tuchar;
  fn_callconv := cc_default;
  fn_params := ((_header, (tptr tuint)) :: nil);
  fn_vars := nil;
  fn_temps := ((_t'1, tuint) :: nil);
  fn_body :=
(Ssequence
  (Sset _t'1 (Ederef (Etempvar _header (tptr tuint)) tuint))
  (Sreturn (Some (Ebinop Oand (Etempvar _t'1 tuint)
                   (Econst_int (Int.repr 255) tint) tuint))))
|}.

Definition f_certicoq_block__set_tag := {|
  fn_return := tuint;
  fn_callconv := cc_default;
  fn_params := ((_header, (tptr tuint)) :: (_tag, tuchar) :: nil);
  fn_vars := nil;
  fn_temps := ((_t'1, tuint) :: nil);
  fn_body :=
(Ssequence
  (Sset _t'1 (Ederef (Etempvar _header (tptr tuint)) tuint))
  (Sreturn (Some (Ebinop Oor
                   (Ebinop Oand (Etempvar _t'1 tuint)
                     (Eunop Onotint (Econst_int (Int.repr 255) tint) tint)
                     tuint) (Etempvar _tag tuchar) tuint))))
|}.

Definition f_certicoq_block__get_field_ptr := {|
  fn_return := (tptr (talignas 2%N (tptr tvoid)));
  fn_callconv := cc_default;
  fn_params := ((_block, (tptr (talignas 2%N (tptr tvoid)))) ::
                (_field, tuint) :: nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Sreturn (Some (Ebinop Oadd
                 (Etempvar _block (tptr (talignas 2%N (tptr tvoid))))
                 (Etempvar _field tuint) (tptr (talignas 2%N (tptr tvoid))))))
|}.

Definition f_certicoq_block__get_field := {|
  fn_return := (talignas 2%N (tptr tvoid));
  fn_callconv := cc_default;
  fn_params := ((_block, (tptr (talignas 2%N (tptr tvoid)))) ::
                (_field, tuint) :: nil);
  fn_vars := nil;
  fn_temps := ((_t'1, (talignas 2%N (tptr tvoid))) :: nil);
  fn_body :=
(Ssequence
  (Sset _t'1
    (Ederef
      (Ebinop Oadd (Etempvar _block (tptr (talignas 2%N (tptr tvoid))))
        (Etempvar _field tuint) (tptr (talignas 2%N (tptr tvoid))))
      (talignas 2%N (tptr tvoid))))
  (Sreturn (Some (Etempvar _t'1 (talignas 2%N (tptr tvoid))))))
|}.

Definition f_certicoq_block__set_field := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_block, (tptr (talignas 2%N (tptr tvoid)))) ::
                (_field, tuint) :: (_x, (talignas 2%N (tptr tvoid))) :: nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Sassign
  (Ederef
    (Ebinop Oadd (Etempvar _block (tptr (talignas 2%N (tptr tvoid))))
      (Etempvar _field tuint) (tptr (talignas 2%N (tptr tvoid))))
    (talignas 2%N (tptr tvoid))) (Etempvar _x (talignas 2%N (tptr tvoid))))
|}.

Definition f_certicoq_block__get_odata := {|
  fn_return := tuint;
  fn_callconv := cc_default;
  fn_params := ((_block, (tptr (talignas 2%N (tptr tvoid)))) :: nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Sreturn (Some (Econst_int (Int.repr 0) tint)))
|}.

Definition f_certicoq_block__set_odata := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_block, (tptr (talignas 2%N (tptr tvoid)))) ::
                (_odata, tuint) :: nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
Sskip
|}.

Definition composites : list composite_definition :=
nil.

Definition global_definitions : list (ident * globdef fundef type) :=
((___builtin_ais_annot,
   Gfun(External (EF_builtin "__builtin_ais_annot"
                   (mksignature (AST.Tint :: nil) AST.Tvoid
                     {|cc_vararg:=(Some 1); cc_unproto:=false; cc_structret:=false|}))
     (Tcons (tptr tschar) Tnil) tvoid
     {|cc_vararg:=(Some 1); cc_unproto:=false; cc_structret:=false|})) ::
 (___builtin_bswap64,
   Gfun(External (EF_builtin "__builtin_bswap64"
                   (mksignature (AST.Tlong :: nil) AST.Tlong cc_default))
     (Tcons tulong Tnil) tulong cc_default)) ::
 (___builtin_bswap,
   Gfun(External (EF_builtin "__builtin_bswap"
                   (mksignature (AST.Tint :: nil) AST.Tint cc_default))
     (Tcons tuint Tnil) tuint cc_default)) ::
 (___builtin_bswap32,
   Gfun(External (EF_builtin "__builtin_bswap32"
                   (mksignature (AST.Tint :: nil) AST.Tint cc_default))
     (Tcons tuint Tnil) tuint cc_default)) ::
 (___builtin_bswap16,
   Gfun(External (EF_builtin "__builtin_bswap16"
                   (mksignature (AST.Tint :: nil) AST.Tint16unsigned
                     cc_default)) (Tcons tushort Tnil) tushort cc_default)) ::
 (___builtin_clz,
   Gfun(External (EF_builtin "__builtin_clz"
                   (mksignature (AST.Tint :: nil) AST.Tint cc_default))
     (Tcons tuint Tnil) tint cc_default)) ::
 (___builtin_clzl,
   Gfun(External (EF_builtin "__builtin_clzl"
                   (mksignature (AST.Tint :: nil) AST.Tint cc_default))
     (Tcons tuint Tnil) tint cc_default)) ::
 (___builtin_clzll,
   Gfun(External (EF_builtin "__builtin_clzll"
                   (mksignature (AST.Tlong :: nil) AST.Tint cc_default))
     (Tcons tulong Tnil) tint cc_default)) ::
 (___builtin_ctz,
   Gfun(External (EF_builtin "__builtin_ctz"
                   (mksignature (AST.Tint :: nil) AST.Tint cc_default))
     (Tcons tuint Tnil) tint cc_default)) ::
 (___builtin_ctzl,
   Gfun(External (EF_builtin "__builtin_ctzl"
                   (mksignature (AST.Tint :: nil) AST.Tint cc_default))
     (Tcons tuint Tnil) tint cc_default)) ::
 (___builtin_ctzll,
   Gfun(External (EF_builtin "__builtin_ctzll"
                   (mksignature (AST.Tlong :: nil) AST.Tint cc_default))
     (Tcons tulong Tnil) tint cc_default)) ::
 (___builtin_fabs,
   Gfun(External (EF_builtin "__builtin_fabs"
                   (mksignature (AST.Tfloat :: nil) AST.Tfloat cc_default))
     (Tcons tdouble Tnil) tdouble cc_default)) ::
 (___builtin_fabsf,
   Gfun(External (EF_builtin "__builtin_fabsf"
                   (mksignature (AST.Tsingle :: nil) AST.Tsingle cc_default))
     (Tcons tfloat Tnil) tfloat cc_default)) ::
 (___builtin_fsqrt,
   Gfun(External (EF_builtin "__builtin_fsqrt"
                   (mksignature (AST.Tfloat :: nil) AST.Tfloat cc_default))
     (Tcons tdouble Tnil) tdouble cc_default)) ::
 (___builtin_sqrt,
   Gfun(External (EF_builtin "__builtin_sqrt"
                   (mksignature (AST.Tfloat :: nil) AST.Tfloat cc_default))
     (Tcons tdouble Tnil) tdouble cc_default)) ::
 (___builtin_memcpy_aligned,
   Gfun(External (EF_builtin "__builtin_memcpy_aligned"
                   (mksignature
                     (AST.Tint :: AST.Tint :: AST.Tint :: AST.Tint :: nil)
                     AST.Tvoid cc_default))
     (Tcons (tptr tvoid)
       (Tcons (tptr tvoid) (Tcons tuint (Tcons tuint Tnil)))) tvoid
     cc_default)) ::
 (___builtin_sel,
   Gfun(External (EF_builtin "__builtin_sel"
                   (mksignature (AST.Tint :: nil) AST.Tvoid
                     {|cc_vararg:=(Some 1); cc_unproto:=false; cc_structret:=false|}))
     (Tcons tbool Tnil) tvoid
     {|cc_vararg:=(Some 1); cc_unproto:=false; cc_structret:=false|})) ::
 (___builtin_annot,
   Gfun(External (EF_builtin "__builtin_annot"
                   (mksignature (AST.Tint :: nil) AST.Tvoid
                     {|cc_vararg:=(Some 1); cc_unproto:=false; cc_structret:=false|}))
     (Tcons (tptr tschar) Tnil) tvoid
     {|cc_vararg:=(Some 1); cc_unproto:=false; cc_structret:=false|})) ::
 (___builtin_annot_intval,
   Gfun(External (EF_builtin "__builtin_annot_intval"
                   (mksignature (AST.Tint :: AST.Tint :: nil) AST.Tint
                     cc_default)) (Tcons (tptr tschar) (Tcons tint Tnil))
     tint cc_default)) ::
 (___builtin_membar,
   Gfun(External (EF_builtin "__builtin_membar"
                   (mksignature nil AST.Tvoid cc_default)) Tnil tvoid
     cc_default)) ::
 (___builtin_va_start,
   Gfun(External (EF_builtin "__builtin_va_start"
                   (mksignature (AST.Tint :: nil) AST.Tvoid cc_default))
     (Tcons (tptr tvoid) Tnil) tvoid cc_default)) ::
 (___builtin_va_arg,
   Gfun(External (EF_builtin "__builtin_va_arg"
                   (mksignature (AST.Tint :: AST.Tint :: nil) AST.Tvoid
                     cc_default)) (Tcons (tptr tvoid) (Tcons tuint Tnil))
     tvoid cc_default)) ::
 (___builtin_va_copy,
   Gfun(External (EF_builtin "__builtin_va_copy"
                   (mksignature (AST.Tint :: AST.Tint :: nil) AST.Tvoid
                     cc_default))
     (Tcons (tptr tvoid) (Tcons (tptr tvoid) Tnil)) tvoid cc_default)) ::
 (___builtin_va_end,
   Gfun(External (EF_builtin "__builtin_va_end"
                   (mksignature (AST.Tint :: nil) AST.Tvoid cc_default))
     (Tcons (tptr tvoid) Tnil) tvoid cc_default)) ::
 (___compcert_va_int32,
   Gfun(External (EF_external "__compcert_va_int32"
                   (mksignature (AST.Tint :: nil) AST.Tint cc_default))
     (Tcons (tptr tvoid) Tnil) tuint cc_default)) ::
 (___compcert_va_int64,
   Gfun(External (EF_external "__compcert_va_int64"
                   (mksignature (AST.Tint :: nil) AST.Tlong cc_default))
     (Tcons (tptr tvoid) Tnil) tulong cc_default)) ::
 (___compcert_va_float64,
   Gfun(External (EF_external "__compcert_va_float64"
                   (mksignature (AST.Tint :: nil) AST.Tfloat cc_default))
     (Tcons (tptr tvoid) Tnil) tdouble cc_default)) ::
 (___compcert_va_composite,
   Gfun(External (EF_external "__compcert_va_composite"
                   (mksignature (AST.Tint :: AST.Tint :: nil) AST.Tint
                     cc_default)) (Tcons (tptr tvoid) (Tcons tuint Tnil))
     (tptr tvoid) cc_default)) ::
 (___builtin_unreachable,
   Gfun(External (EF_builtin "__builtin_unreachable"
                   (mksignature nil AST.Tvoid cc_default)) Tnil tvoid
     cc_default)) ::
 (___builtin_expect,
   Gfun(External (EF_builtin "__builtin_expect"
                   (mksignature (AST.Tint :: AST.Tint :: nil) AST.Tint
                     cc_default)) (Tcons tint (Tcons tint Tnil)) tint
     cc_default)) ::
 (___compcert_i64_dtos,
   Gfun(External (EF_runtime "__compcert_i64_dtos"
                   (mksignature (AST.Tfloat :: nil) AST.Tlong cc_default))
     (Tcons tdouble Tnil) tlong cc_default)) ::
 (___compcert_i64_dtou,
   Gfun(External (EF_runtime "__compcert_i64_dtou"
                   (mksignature (AST.Tfloat :: nil) AST.Tlong cc_default))
     (Tcons tdouble Tnil) tulong cc_default)) ::
 (___compcert_i64_stod,
   Gfun(External (EF_runtime "__compcert_i64_stod"
                   (mksignature (AST.Tlong :: nil) AST.Tfloat cc_default))
     (Tcons tlong Tnil) tdouble cc_default)) ::
 (___compcert_i64_utod,
   Gfun(External (EF_runtime "__compcert_i64_utod"
                   (mksignature (AST.Tlong :: nil) AST.Tfloat cc_default))
     (Tcons tulong Tnil) tdouble cc_default)) ::
 (___compcert_i64_stof,
   Gfun(External (EF_runtime "__compcert_i64_stof"
                   (mksignature (AST.Tlong :: nil) AST.Tsingle cc_default))
     (Tcons tlong Tnil) tfloat cc_default)) ::
 (___compcert_i64_utof,
   Gfun(External (EF_runtime "__compcert_i64_utof"
                   (mksignature (AST.Tlong :: nil) AST.Tsingle cc_default))
     (Tcons tulong Tnil) tfloat cc_default)) ::
 (___compcert_i64_sdiv,
   Gfun(External (EF_runtime "__compcert_i64_sdiv"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil) AST.Tlong
                     cc_default)) (Tcons tlong (Tcons tlong Tnil)) tlong
     cc_default)) ::
 (___compcert_i64_udiv,
   Gfun(External (EF_runtime "__compcert_i64_udiv"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil) AST.Tlong
                     cc_default)) (Tcons tulong (Tcons tulong Tnil)) tulong
     cc_default)) ::
 (___compcert_i64_smod,
   Gfun(External (EF_runtime "__compcert_i64_smod"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil) AST.Tlong
                     cc_default)) (Tcons tlong (Tcons tlong Tnil)) tlong
     cc_default)) ::
 (___compcert_i64_umod,
   Gfun(External (EF_runtime "__compcert_i64_umod"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil) AST.Tlong
                     cc_default)) (Tcons tulong (Tcons tulong Tnil)) tulong
     cc_default)) ::
 (___compcert_i64_shl,
   Gfun(External (EF_runtime "__compcert_i64_shl"
                   (mksignature (AST.Tlong :: AST.Tint :: nil) AST.Tlong
                     cc_default)) (Tcons tlong (Tcons tint Tnil)) tlong
     cc_default)) ::
 (___compcert_i64_shr,
   Gfun(External (EF_runtime "__compcert_i64_shr"
                   (mksignature (AST.Tlong :: AST.Tint :: nil) AST.Tlong
                     cc_default)) (Tcons tulong (Tcons tint Tnil)) tulong
     cc_default)) ::
 (___compcert_i64_sar,
   Gfun(External (EF_runtime "__compcert_i64_sar"
                   (mksignature (AST.Tlong :: AST.Tint :: nil) AST.Tlong
                     cc_default)) (Tcons tlong (Tcons tint Tnil)) tlong
     cc_default)) ::
 (___compcert_i64_smulh,
   Gfun(External (EF_runtime "__compcert_i64_smulh"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil) AST.Tlong
                     cc_default)) (Tcons tlong (Tcons tlong Tnil)) tlong
     cc_default)) ::
 (___compcert_i64_umulh,
   Gfun(External (EF_runtime "__compcert_i64_umulh"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil) AST.Tlong
                     cc_default)) (Tcons tulong (Tcons tulong Tnil)) tulong
     cc_default)) ::
 (___builtin_fmax,
   Gfun(External (EF_builtin "__builtin_fmax"
                   (mksignature (AST.Tfloat :: AST.Tfloat :: nil) AST.Tfloat
                     cc_default)) (Tcons tdouble (Tcons tdouble Tnil))
     tdouble cc_default)) ::
 (___builtin_fmin,
   Gfun(External (EF_builtin "__builtin_fmin"
                   (mksignature (AST.Tfloat :: AST.Tfloat :: nil) AST.Tfloat
                     cc_default)) (Tcons tdouble (Tcons tdouble Tnil))
     tdouble cc_default)) ::
 (___builtin_fmadd,
   Gfun(External (EF_builtin "__builtin_fmadd"
                   (mksignature
                     (AST.Tfloat :: AST.Tfloat :: AST.Tfloat :: nil)
                     AST.Tfloat cc_default))
     (Tcons tdouble (Tcons tdouble (Tcons tdouble Tnil))) tdouble
     cc_default)) ::
 (___builtin_fmsub,
   Gfun(External (EF_builtin "__builtin_fmsub"
                   (mksignature
                     (AST.Tfloat :: AST.Tfloat :: AST.Tfloat :: nil)
                     AST.Tfloat cc_default))
     (Tcons tdouble (Tcons tdouble (Tcons tdouble Tnil))) tdouble
     cc_default)) ::
 (___builtin_fnmadd,
   Gfun(External (EF_builtin "__builtin_fnmadd"
                   (mksignature
                     (AST.Tfloat :: AST.Tfloat :: AST.Tfloat :: nil)
                     AST.Tfloat cc_default))
     (Tcons tdouble (Tcons tdouble (Tcons tdouble Tnil))) tdouble
     cc_default)) ::
 (___builtin_fnmsub,
   Gfun(External (EF_builtin "__builtin_fnmsub"
                   (mksignature
                     (AST.Tfloat :: AST.Tfloat :: AST.Tfloat :: nil)
                     AST.Tfloat cc_default))
     (Tcons tdouble (Tcons tdouble (Tcons tdouble Tnil))) tdouble
     cc_default)) ::
 (___builtin_read16_reversed,
   Gfun(External (EF_builtin "__builtin_read16_reversed"
                   (mksignature (AST.Tint :: nil) AST.Tint16unsigned
                     cc_default)) (Tcons (tptr tushort) Tnil) tushort
     cc_default)) ::
 (___builtin_read32_reversed,
   Gfun(External (EF_builtin "__builtin_read32_reversed"
                   (mksignature (AST.Tint :: nil) AST.Tint cc_default))
     (Tcons (tptr tuint) Tnil) tuint cc_default)) ::
 (___builtin_write16_reversed,
   Gfun(External (EF_builtin "__builtin_write16_reversed"
                   (mksignature (AST.Tint :: AST.Tint :: nil) AST.Tvoid
                     cc_default)) (Tcons (tptr tushort) (Tcons tushort Tnil))
     tvoid cc_default)) ::
 (___builtin_write32_reversed,
   Gfun(External (EF_builtin "__builtin_write32_reversed"
                   (mksignature (AST.Tint :: AST.Tint :: nil) AST.Tvoid
                     cc_default)) (Tcons (tptr tuint) (Tcons tuint Tnil))
     tvoid cc_default)) ::
 (___builtin_debug,
   Gfun(External (EF_external "__builtin_debug"
                   (mksignature (AST.Tint :: nil) AST.Tvoid
                     {|cc_vararg:=(Some 1); cc_unproto:=false; cc_structret:=false|}))
     (Tcons tint Tnil) tvoid
     {|cc_vararg:=(Some 1); cc_unproto:=false; cc_structret:=false|})) ::
 (_int_or_ptr__of_int,
   Gfun(External (EF_external "int_or_ptr__of_int"
                   (mksignature (AST.Tint :: nil) AST.Tint cc_default))
     (Tcons tint Tnil) (talignas 2%N (tptr tvoid)) cc_default)) ::
 (_certicoq_block__init, Gfun(Internal f_certicoq_block__init)) ::
 (_certicoq_block__of_header, Gfun(Internal f_certicoq_block__of_header)) ::
 (_certicoq_block__copy, Gfun(Internal f_certicoq_block__copy)) ::
 (_certicoq_block__get_header_ptr, Gfun(Internal f_certicoq_block__get_header_ptr)) ::
 (_certicoq_block__set_header, Gfun(Internal f_certicoq_block__set_header)) ::
 (_certicoq_block__get_size, Gfun(Internal f_certicoq_block__get_size)) ::
 (_certicoq_block__get_field_count, Gfun(Internal f_certicoq_block__get_field_count)) ::
 (_certicoq_block__set_field_count, Gfun(Internal f_certicoq_block__set_field_count)) ::
 (_certicoq_block__get_tag, Gfun(Internal f_certicoq_block__get_tag)) ::
 (_certicoq_block__set_tag, Gfun(Internal f_certicoq_block__set_tag)) ::
 (_certicoq_block__get_field_ptr, Gfun(Internal f_certicoq_block__get_field_ptr)) ::
 (_certicoq_block__get_field, Gfun(Internal f_certicoq_block__get_field)) ::
 (_certicoq_block__set_field, Gfun(Internal f_certicoq_block__set_field)) ::
 (_certicoq_block__get_odata, Gfun(Internal f_certicoq_block__get_odata)) ::
 (_certicoq_block__set_odata, Gfun(Internal f_certicoq_block__set_odata)) ::
 nil).

Definition public_idents : list ident :=
(_certicoq_block__set_odata :: _certicoq_block__get_odata ::
 _certicoq_block__set_field :: _certicoq_block__get_field ::
 _certicoq_block__get_field_ptr :: _certicoq_block__set_tag ::
 _certicoq_block__get_tag :: _certicoq_block__set_field_count ::
 _certicoq_block__get_field_count :: _certicoq_block__get_size ::
 _certicoq_block__set_header :: _certicoq_block__get_header_ptr ::
 _certicoq_block__copy :: _certicoq_block__of_header ::
 _certicoq_block__init :: _int_or_ptr__of_int :: ___builtin_debug ::
 ___builtin_write32_reversed :: ___builtin_write16_reversed ::
 ___builtin_read32_reversed :: ___builtin_read16_reversed ::
 ___builtin_fnmsub :: ___builtin_fnmadd :: ___builtin_fmsub ::
 ___builtin_fmadd :: ___builtin_fmin :: ___builtin_fmax ::
 ___compcert_i64_umulh :: ___compcert_i64_smulh :: ___compcert_i64_sar ::
 ___compcert_i64_shr :: ___compcert_i64_shl :: ___compcert_i64_umod ::
 ___compcert_i64_smod :: ___compcert_i64_udiv :: ___compcert_i64_sdiv ::
 ___compcert_i64_utof :: ___compcert_i64_stof :: ___compcert_i64_utod ::
 ___compcert_i64_stod :: ___compcert_i64_dtou :: ___compcert_i64_dtos ::
 ___builtin_expect :: ___builtin_unreachable :: ___compcert_va_composite ::
 ___compcert_va_float64 :: ___compcert_va_int64 :: ___compcert_va_int32 ::
 ___builtin_va_end :: ___builtin_va_copy :: ___builtin_va_arg ::
 ___builtin_va_start :: ___builtin_membar :: ___builtin_annot_intval ::
 ___builtin_annot :: ___builtin_sel :: ___builtin_memcpy_aligned ::
 ___builtin_sqrt :: ___builtin_fsqrt :: ___builtin_fabsf ::
 ___builtin_fabs :: ___builtin_ctzll :: ___builtin_ctzl :: ___builtin_ctz ::
 ___builtin_clzll :: ___builtin_clzl :: ___builtin_clz ::
 ___builtin_bswap16 :: ___builtin_bswap32 :: ___builtin_bswap ::
 ___builtin_bswap64 :: ___builtin_ais_annot :: nil).

Definition prog : Clight.program := 
  mkprogram composites global_definitions public_idents _main Logic.I.


(*\nInput hashes (sha256):\n\n29aabd2f353db23e07e52f8d7ef030c6ce67813ad0040ffbe501ba07a7c9f2b7  src/c/include/coq-vsu-certicoq-block/src/block.c
7d18870b096d1155066b9c478058a71400656ad1912359d3eeb2b6443d1b556b  src/c/include/coq-vsu-certicoq-block/block.h\n*)

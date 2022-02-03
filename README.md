# coq-certicoq-block

[![build](https://github.com/appliedfm/coq-certicoq-block/actions/workflows/build.yml/badge.svg)](https://github.com/appliedfm/coq-certicoq-block/actions/workflows/build.yml)

![GitHub](https://img.shields.io/github/license/appliedfm/coq-certicoq-block)

A [Verified Software Unit](https://github.com/appliedfm/coq-vsu) for using aligned pointers as integers.

Implemented in C, modeled in [Coq](https://coq.inria.fr), and proven correct using the [Verified Software Toolchain](https://vst.cs.princeton.edu/).

Compatible with [CompCert](https://compcert.org/).


## Verification status

Specifications are provided for the following targets:

- [x] `x86_64-linux`
- [x] `x86_32-linux`

Proofs are checked by our [CI infrastructure](https://github.com/appliedfm/coq-certicoq-block/actions/workflows/build.yml).


## Packages

* `coq-certicoq-block` - functional model
* `coq-certicoq-block-src` - C source code
* `coq-certicoq-block-vst` - VST spec (`x86_64-linux`)
* `coq-certicoq-block-vst-32` - VST spec (`x86_32-linux`)


## Installing

Installation is performed by `opam` with help by [coq-vsu](https://github.com/appliedfm/coq-vsu).

```console
$ opam pin -n -y .
$ opam install coq-certicoq-block
```


## Using the C library

The C library is installed to the path given by `vsu -I`. For example:

```console
$ tree `vsu -I`
/home/tcarstens/.opam/coq-8.14/lib/coq-vsu/lib/include
└── coq-certicoq-block
    ├── block.h
    └── src
        └── block.c

2 directories, 2 files
$
```


## Using the Coq library

We currently publish three Coq libraries:

* `coq-certicoq-block` - functional model
* `coq-certicoq-block-vst` - VST spec (`x86_64-linux`)
* `coq-certicoq-block-vst-32` - VST spec (`x86_32-linux`)

The `coq-certicoq-block` library is target-agnostic and is therefore always installed into a location within Coq's search path.

However, `coq-certicoq-block-vst` and `coq-certicoq-block-vst-32` are both target-specific. As such, they are sometimes installed into locations outside of Coq's search path. Fortunately, these libraries can be found by calling `vsu --show-coq-variant-path=PACKAGE`. For example:

```console
$ echo `vsu --show-coq-variant-path=coq-certicoq-block-vst-32`
$
```

The `vsu` tool can also be used to supply Coq with the correct arguments for importing the target-specific libraries. For example:

```
$ tcarstens@pop-os:~/formal_methods/coq-certicoq-block$ coqtop \
    `vsu -Q coq-certicoq-block-vst-32` \
    `vsu -Q coq-compcert-32` \
    `vsu -Q coq-vst-32`
Welcome to Coq 8.14.0

Coq < From VST Require Import floyd.proofauto.

Coq < From CertiCoq Require Import Block.vst.spec.spec.

Coq < Check int_or_ptr__is_int_spec.
int_or_ptr__is_int_spec
     : ident * funspec

Coq < 
```


## Building without `opam`

The general pattern looks like this:

```console
$ make [verydeepclean|deepclean|clean]
$ make BITSIZE={opam|64|32} [all|_CoqProject|clightgen|theories]
```

`BITSIZE` determines which `compcert` target to use. If unspecified, the default value is `opam`:

* `opam` and `64` both use `x86_64-linux`
* `32` uses `x86_32-linux`

### Example: `x86_64-linux`

```console
$ make verydeepclean ; make
```

### Example: `x86_32-linux`

```console
$ make verydeepclean ; make BITSIZE=32
```

#

[![Coq](https://img.shields.io/badge/-Coq-royalblue)](https://github.com/coq/coq)
[![compcert](https://img.shields.io/badge/-compcert-pink)](https://compcert.org/)
[![VST](https://img.shields.io/badge/-VST-palevioletred)](https://vst.cs.princeton.edu/)

[![applied.fm](https://img.shields.io/badge/-applied.fm-orchid)](https://applied.fm)

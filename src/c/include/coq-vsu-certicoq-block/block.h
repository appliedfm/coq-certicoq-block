#ifndef COQ_CERTICOQ_BLOCK__BLOCK_H
#define COQ_CERTICOQ_BLOCK__BLOCK_H

#include <stdint.h>
#include <stddef.h>
#include <coq-vsu-int_or_ptr/int_or_ptr.h>

/* EXPLANATION OF THE CERTICOQ BLOCK FORMAT.
Andrew W. Appel, September 2016
Timothy M. Carstens, February 2022

The current Certicoq code generator uses Ocaml object formats,
as described in Chapter 20 of Real World Ocaml by Minsky et al.
https://realworldocaml.org/v1/en/html/memory-representation-of-values.html

That is:

       31   10 9       8 7        0
      +-------+---------+----------+
      | size  |  color  | tag byte |
      +-------+---------+----------+
v --> |              value[0]      |
      +----------------------------+
      |              value[1]      |
      +----------------------------+
      |                   .        |
      |                   .        |
      |                   .        |
      +----------------------------+
      |           value[size-1]    |
      +----------------------------+

This works for 32-bit or 64-bit words;
if 64-bit words, substitute "63" for "31" in the diagram above.
At present we'll assume 32-bit words.

Following compcert's recommendation, we use intptr_t and uintptr_t
instead of OCaml's "intnat" and "uintnat."

To support modular verification, we have also reimplemented OCaml's
preprocessor macros as ordinary C functions.

Is_block(v) :
  !int_or_ptr__is_int(v)
Hd_val(v)   :
  *certicoq_block__header_get_ptr(v)
  certicoq_block__header_set(v, -)
Field(v,i)  :
  certicoq_block__field_get_ptr(v, i)
  certicoq_block__field_get(v, i)
  certicoq_block__field_set(v, i, -)
Tag_hd(h)   :
  certicoq_block__tag_get(h)
Wosize_hd(h):
  certicoq_block__field_count_get(h)

We define the following ourselves, following Ocaml's format:

certicoq_block__tag_is_noscan(t)  :
  If t is a constructor-tag, true if none of the object's data words are to
  be interpreted as pointers. (For example, character-string data.)
*/

typedef uintptr_t certicoq_block_header_t;
typedef uint8_t certicoq_block_tag_t;
typedef int_or_ptr *certicoq_block_t;

certicoq_block_t certicoq_block__init(int_or_ptr *dst, const certicoq_block_header_t *header);
certicoq_block_t certicoq_block__of_header(const certicoq_block_header_t *header);
certicoq_block_t certicoq_block__copy(int_or_ptr *dst, const certicoq_block_t src);

const certicoq_block_header_t *certicoq_block__header_get_ptr(const certicoq_block_t block);

size_t certicoq_block__size_get(const certicoq_block_header_t *header);

size_t certicoq_block__field_count_get(const certicoq_block_header_t *header);
void certicoq_block__field_count_set(certicoq_block_header_t *header, size_t size);

certicoq_block_tag_t certicoq_block__tag_get(const certicoq_block_header_t *header);
void certicoq_block__tag_set(certicoq_block_header_t *header, certicoq_block_tag_t tag);
certicoq_block_tag_t certicoq_block__tag_noscan_limit();
int certicoq_block__tag_is_noscan(certicoq_block_tag_t tag);

uint8_t certicoq_block__odata_get(const certicoq_block_header_t *header);
void certicoq_block__odata_set(certicoq_block_header_t *header, uint8_t odata);

int_or_ptr *certicoq_block__field_get_ptr(certicoq_block_t block, size_t field);
int_or_ptr certicoq_block__field_get(const certicoq_block_t block, size_t field);
void certicoq_block__field_set(certicoq_block_t block, size_t field, int_or_ptr x);

void certicoq_block__field_iter(certicoq_block_t block, void (*f)(const void *, void *, int_or_ptr *), const void *c_args, void *f_args);
void certicoq_block__field_ptr_iter(certicoq_block_t block, void (*f)(const void *, void *, int_or_ptr *), const void *c_args, void *f_args);

#endif /* COQ_CERTICOQ_BLOCK__BLOCK_H */

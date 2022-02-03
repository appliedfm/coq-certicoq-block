#ifndef COQ_CERTICOQ_BLOCK__BLOCK_H
#define COQ_CERTICOQ_BLOCK__BLOCK_H

#include <stdint.h>
#include <stddef.h>
#include <coq-vsu-int_or_ptr/int_or_ptr.h>

typedef uintptr_t certicoq_block_header_t;
typedef uint8_t certicoq_block_tag_t;

typedef int_or_ptr *certicoq_block_t __attribute((aligned(_Alignof(int_or_ptr))));

certicoq_block_t certicoq_block__init(int_or_ptr *block, certicoq_block_header_t header);

certicoq_block_header_t certicoq_block__get_header(const certicoq_block_t block);
void certicoq_block__set_header(certicoq_block_t block, certicoq_block_header_t header);

size_t certicoq_block__get_size(certicoq_block_header_t header);
certicoq_block_header_t certicoq_block__set_size(certicoq_block_header_t header, size_t size);

certicoq_block_tag_t certicoq_block__get_tag(certicoq_block_header_t header);
certicoq_block_header_t certicoq_block__set_tag(certicoq_block_header_t header, certicoq_block_tag_t tag);

int_or_ptr certicoq_block__get_field(certicoq_block_t block, size_t field);
void certicoq_block__set_field(certicoq_block_t block, size_t field, int_or_ptr x);

#endif /* COQ_CERTICOQ_BLOCK__BLOCK_H */

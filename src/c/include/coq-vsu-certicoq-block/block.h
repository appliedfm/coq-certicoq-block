#ifndef COQ_CERTICOQ_BLOCK__BLOCK_H
#define COQ_CERTICOQ_BLOCK__BLOCK_H

#include <stdint.h>
#include <stddef.h>
#include <coq-vsu-int_or_ptr/int_or_ptr.h>

typedef uintptr_t certicoq_block_header_t;
typedef uint8_t certicoq_block_tag_t;
typedef int_or_ptr *certicoq_block_t;

certicoq_block_t certicoq_block__init(int_or_ptr *dst, const certicoq_block_header_t *header);
certicoq_block_t certicoq_block__of_header(certicoq_block_header_t *header);
certicoq_block_t certicoq_block__copy(int_or_ptr *dst, const certicoq_block_t src);

certicoq_block_header_t *certicoq_block__header_get_ptr(const certicoq_block_t block);
void certicoq_block__header_set(certicoq_block_t block, const certicoq_block_header_t *header);

size_t certicoq_block__size_get(const certicoq_block_header_t *header);

size_t certicoq_block__field_count_get(const certicoq_block_header_t *header);
void certicoq_block__field_count_set(certicoq_block_header_t *header, size_t size);

certicoq_block_tag_t certicoq_block__tag_get(const certicoq_block_header_t *header);
void certicoq_block__tag_set(certicoq_block_header_t *header, certicoq_block_tag_t tag);

uint8_t certicoq_block__odata_get(const certicoq_block_header_t *header);
void certicoq_block__odata_set(certicoq_block_header_t *header, uint8_t odata);

int_or_ptr *certicoq_block__field_get_ptr(certicoq_block_t block, size_t field);
int_or_ptr certicoq_block__field_get(const certicoq_block_t block, size_t field);
void certicoq_block__field_set(certicoq_block_t block, size_t field, int_or_ptr x);

void certicoq_block__field_iter(certicoq_block_t block, void (*f)(void *, int_or_ptr *), void *f_data);
void certicoq_block__field_int_iter(certicoq_block_t block, void (*f)(void *, int_or_ptr *), void *f_data);
void certicoq_block__field_ptr_iter(certicoq_block_t block, void (*f)(void *, int_or_ptr *), void *f_data);

#endif /* COQ_CERTICOQ_BLOCK__BLOCK_H */

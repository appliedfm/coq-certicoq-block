#ifndef COQ_CERTICOQ_BLOCK__BLOCK_C
#define COQ_CERTICOQ_BLOCK__BLOCK_C

#include "../block.h"

certicoq_block_t certicoq_block__init(int_or_ptr *block, certicoq_block_header_t header)
{
    certicoq_block_t ret = block + 1;
    certicoq_block__set_header(ret, header);
    return ret;
}

certicoq_block_header_t certicoq_block__get_header(const certicoq_block_t block)
{
    return int_or_ptr__to_int(block[-1]);
}

void certicoq_block__set_header(certicoq_block_t block, certicoq_block_header_t header)
{
    block[-1] = int_or_ptr__of_int(header);
}

size_t certicoq_block__get_field_count(certicoq_block_header_t header)
{
    return header >> 10;
}

certicoq_block_header_t certicoq_block__set_field_count(certicoq_block_header_t header, size_t size)
{
    return (header & ~((1 << 10) - 1)) | (size << 10);
}

certicoq_block_tag_t certicoq_block__get_tag(certicoq_block_header_t header)
{
    return header & 0xff;
}

certicoq_block_header_t certicoq_block__set_tag(certicoq_block_header_t header, certicoq_block_tag_t tag)
{
    return (header & ~0xff) | tag;
}

int_or_ptr *certicoq_block__get_field_ptr(certicoq_block_t block, size_t field)
{
    return &block[field];
}

int_or_ptr certicoq_block__get_field(certicoq_block_t block, size_t field)
{
    return block[field];
}

void certicoq_block__set_field(certicoq_block_t block, size_t field, int_or_ptr x)
{
    block[field] = x;
}

uintptr_t certicoq_block__get_odata(certicoq_block_t block)
{
    return 0; // TODO
}

void certicoq_block__set_odata(certicoq_block_t block, uintptr_t odata)
{
    // TODO
}

#endif /* COQ_CERTICOQ_BLOCK__BLOCK_H */

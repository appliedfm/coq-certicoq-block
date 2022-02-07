#ifndef COQ_CERTICOQ_BLOCK__BLOCK_C
#define COQ_CERTICOQ_BLOCK__BLOCK_C

#include "../block.h"

certicoq_block_t certicoq_block__init(int_or_ptr *dst, const certicoq_block_header_t *header)
{
    certicoq_block_t ret = dst + 1;
    certicoq_block__set_header(ret, header);
    return ret;
}

certicoq_block_t certicoq_block__of_header(certicoq_block_header_t *header)
{
    return (certicoq_block_t)header + 1;
}

certicoq_block_t certicoq_block__copy(int_or_ptr *dst, const certicoq_block_t src)
{
    certicoq_block_header_t *hd = certicoq_block__get_header_ptr(src);
    certicoq_block_t ret = certicoq_block__init(dst, hd);
    size_t field_count = certicoq_block__get_field_count(hd);
    size_t i;
    for (i = 0; i < field_count; i++)
    {
        int_or_ptr f = certicoq_block__get_field(src, i);
        certicoq_block__set_field(ret, i, f);
    }
    return ret;
}

certicoq_block_header_t *certicoq_block__get_header_ptr(const certicoq_block_t block)
{
    return (certicoq_block_header_t *)&block[-1];
}

void certicoq_block__set_header(certicoq_block_t block, const certicoq_block_header_t *header)
{
    block[-1] = int_or_ptr__of_int(*header);
}

size_t certicoq_block__get_size(const certicoq_block_header_t *header)
{
    const size_t zero = 0;
    const size_t one = 1;
    const size_t two = 2;
    const size_t fc = certicoq_block__get_field_count(header);
    return fc > zero ? one + fc : two;
}

size_t certicoq_block__get_field_count(const certicoq_block_header_t *header)
{
    return (header[0]) >> 10;
}

void certicoq_block__set_field_count(certicoq_block_header_t *header, size_t size)
{
    header[0] = ((header[0]) & ~((1 << 10) - 1)) | (size << 10);
}

certicoq_block_tag_t certicoq_block__get_tag(const certicoq_block_header_t *header)
{
    return (header[0]) & 0xff;
}

certicoq_block_header_t certicoq_block__set_tag(certicoq_block_header_t *header, certicoq_block_tag_t tag)
{
    return ((header[0]) & ~0xff) | tag;
}

uint8_t certicoq_block__get_odata(const certicoq_block_header_t *header)
{
    return (header[0] >> 8) & 0x03;
}

void certicoq_block__set_odata(certicoq_block_header_t *header, uint8_t odata)
{
    header[0] = (header[0] & ~(0x03 << 8)) | (odata << 8);
}

int_or_ptr *certicoq_block__get_field_ptr(certicoq_block_t block, size_t field)
{
    return &block[field];
}

int_or_ptr certicoq_block__get_field(const certicoq_block_t block, size_t field)
{
    return block[field];
}

void certicoq_block__set_field(certicoq_block_t block, size_t field, int_or_ptr x)
{
    block[field] = x;
}

#endif /* COQ_CERTICOQ_BLOCK__BLOCK_H */

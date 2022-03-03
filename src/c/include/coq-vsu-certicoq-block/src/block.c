#ifndef COQ_CERTICOQ_BLOCK__BLOCK_C
#define COQ_CERTICOQ_BLOCK__BLOCK_C

#include "../block.h"

certicoq_block_t certicoq_block__init(int_or_ptr *dst, const certicoq_block_header_t *header)
{
  certicoq_block_t ret = dst + 1;
  dst[0] = (int_or_ptr)header[0];
  return ret;
}

certicoq_block_t certicoq_block__of_header(const certicoq_block_header_t *header)
{
  return (certicoq_block_t)header + 1;
}

certicoq_block_t certicoq_block__copy(int_or_ptr *dst, const certicoq_block_t src)
{
  const certicoq_block_header_t *hd = certicoq_block__header_get_ptr(src);
  certicoq_block_t ret = certicoq_block__init(dst, hd);
  size_t field_count = certicoq_block__field_count_get(hd);
  size_t i;
  for (i = 0; i < field_count; i++)
  {
    ret[i] = src[i];
  }
  return ret;
}

const certicoq_block_header_t *certicoq_block__header_get_ptr(const certicoq_block_t block)
{
  return (certicoq_block_header_t *)&block[-1];
}

size_t certicoq_block__size_get(const certicoq_block_header_t *header)
{
  const size_t one = 1;
  const size_t fc = certicoq_block__field_count_get(header);
  return one + fc;
}

size_t certicoq_block__field_count_get(const certicoq_block_header_t *header)
{
  return header[0] >> 10;
}

void certicoq_block__field_count_set(certicoq_block_header_t *header, size_t size)
{
  const certicoq_block_header_t mask = ~(((certicoq_block_header_t)1 << 10) - 1);
  header[0] = (header[0] & mask) | (size << 10);
}

certicoq_block_tag_t certicoq_block__tag_get(const certicoq_block_header_t *header)
{
  return header[0] & 0xff;
}

void certicoq_block__tag_set(certicoq_block_header_t *header, certicoq_block_tag_t tag)
{
  const certicoq_block_header_t mask = ~0xff;
  header[0] = (header[0] & mask) | tag;
}

certicoq_block_tag_t certicoq_block__tag_noscan_limit()
{
  return 251;
}

int certicoq_block__tag_is_noscan(certicoq_block_tag_t tag)
{
  if (tag >= certicoq_block__tag_noscan_limit())
  {
    return 1;
  }
  return 0;
}

uint8_t certicoq_block__odata_get(const certicoq_block_header_t *header)
{
  return (header[0] >> 8) & 0x03;
}

void certicoq_block__odata_set(certicoq_block_header_t *header, uint8_t odata)
{
  const certicoq_block_header_t mask = ~((certicoq_block_header_t)0x03 << 8);
  header[0] = (header[0] & mask) | (odata << 8);
}

int_or_ptr *certicoq_block__field_get_ptr(certicoq_block_t block, size_t field)
{
  return &block[field];
}

void certicoq_block__field_iter(certicoq_block_t block, void (*f)(const void *, void *, int_or_ptr *), const void *c_args, void *f_args)
{
  const certicoq_block_header_t *hd = certicoq_block__header_get_ptr(block);
  const certicoq_block_tag_t tag = certicoq_block__tag_get(hd);
  if (!certicoq_block__tag_is_noscan(tag))
  {
    const size_t field_count = certicoq_block__field_count_get(hd);
    size_t i;
    for (i = 0; i < field_count; i++)
    {
      int_or_ptr *x = certicoq_block__field_get_ptr(block, i);
      f(c_args, f_args, x);
    }
  }
}

void certicoq_block__field_ptr_iter(certicoq_block_t block, void (*f)(const void *, void *, int_or_ptr *), const void *c_args, void *f_args)
{
  const certicoq_block_header_t *hd = certicoq_block__header_get_ptr(block);
  const certicoq_block_tag_t tag = certicoq_block__tag_get(hd);
  if (!certicoq_block__tag_is_noscan(tag))
  {
    const size_t field_count = certicoq_block__field_count_get(hd);
    size_t i;
    for (i = 0; i < field_count; i++)
    {
      int_or_ptr *x = certicoq_block__field_get_ptr(block, i);
      if (!int_or_ptr__is_int(*x))
      {
        f(c_args, f_args, x);
      }
    }
  }
}

#endif /* COQ_CERTICOQ_BLOCK__BLOCK_H */

#pragma once
#include "types.h"

class GlobalDiscriptorTable
{

public:
    class SegmentDiscriptor
    {
        public:
            SegmentDiscriptor(uint32_t base, uint32_t limit, uint8_t type);
            uint32_t Base();
            uint32_t Limit();
        private:
            uint16_t base_lo;
            uint16_t limit_lo;
            uint8_t base_hi;
            uint8_t flag;
            uint8_t flags_limit_hi;
            uint8_t base_vhi;
    } __attribute__((packed));

    SegmentDiscriptor nullSegmentSelector;
    SegmentDiscriptor unusedSegmentSelector;
    SegmentDiscriptor codeSegmentSelector;
    SegmentDiscriptor dataSegmentSelector;

public:

    GlobalDiscriptorTable();
    ~GlobalDiscriptorTable();

    uint16_t CodeSegmentSelector();
    uint16_t DataSegmentSelector();
};
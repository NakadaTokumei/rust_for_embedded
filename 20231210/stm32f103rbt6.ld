ENTRY(main)

MEMORY
{
    RAM (xrw) : ORIGIN = 0x20000000, LENGTH = 20K
    ROM (rx)  : ORIGIN = 0x08000000, LENGTH = 128K
}

SECTIONS
{
    .isr_vector :
    {
        . = ALIGN(4);
        *(.isr_vector)
        . = ALIGN(4);
    } >ROM

    .text :
    {
        . = ALIGN(4);
        *(.text)

        _etext = .;
    } >ROM

    .rodata :
    {
        . = ALIGN(4);
        *(.rodata)
        . = ALIGN(4);
    } >ROM

    .data :
    {
        . = ALIGN(4);
        _sdata = .;
        *(.data)
        . = ALIGN(4);
        _edata = .;
    } >RAM AT> ROM

    .bss :
    {
        _sbss = .;
        *(.bss)
        *(COMMON)

        . = ALIGN(4);
        _ebss = .;
    } >RAM
}
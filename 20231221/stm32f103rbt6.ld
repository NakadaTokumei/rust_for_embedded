ENTRY(Reset_Handler)

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
        KEEP(*(.isr_vector));
        . = ALIGN(4);
    } >ROM

    .text :
    {
        . = ALIGN(4);
        *(.text)
        *(.text.*)
        _etext = .;
    } >ROM

    .rodata :
    {
        . = ALIGN(4);
        *(.rodata)
        . = ALIGN(4);
    } >ROM

    .ARM.extab :
    {
        . = ALIGN(4);
        *(.ARM.extab* .gnu.linkonce.armxtab.*)
        . = ALIGN(4);
    } >ROM

    .ARM :
    {
        . = ALIGN(4);
        __exidx_start = .;
        *(.ARM.exidx*)
        __exidx_end = .;
        . = ALIGN(4);
    } >ROM

    _sidata = LOADADDR(.data);

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
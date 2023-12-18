    .syntax unified
    .cpu cortex-m3
    .thumb

    .global memoryInit

    .word _sdata
    .word 

    .section .text.memoryInit
    .type memoryInit, %function
memoryInit:
    ldr r0, =_sdata     /* Start of .data section */
    ldr r1, =_sidata    /* Start of init .data section */
    ldr r2, =_edata     /* End of data section */
    mov r3, #0x00       /* Read Data */
copy_data:
    ldr r3, [r1, ]

    bx lr
    .size memoryInit, . - memoryInit
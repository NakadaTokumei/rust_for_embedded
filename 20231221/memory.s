    .syntax unified
    .cpu cortex-m3
    .thumb

    .global memoryInit

    .word _sdata
    .word _sidata
    .word _edata
    .word _sbss
    .word _ebss

    .section .text.memoryInit
    .type memoryInit, %function
memoryInit:
    ldr r0, =_sdata     /* Start of .data section */
    ldr r1, =_sidata    /* Start of init .data section */
    ldr r2, =_edata     /* End of data section */
    mov r3, #0          /* Read Data */
    mov r4, #0          /* Current Offset of memory */
    mov r5, #0          /* Current Memory */

copy_data:
    ldr r3, [r1, r4]
    str r3, [r0, r4]
    add r4, r4, #4
    add r5, r0, r4
    cmp r5, r2
    ble copy_data

    ldr r0, =_sbss
    ldr r2, =_ebss
    mov r3, #0
    mov r4, #0
fill_zero_bss:
    str r3, [r0]
    adds r0, r0, #4
    cmp r0, r2
    blo fill_zero_bss

    bx lr
    .size memoryInit, . - memoryInit
    
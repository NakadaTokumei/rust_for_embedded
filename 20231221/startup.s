    .syntax unified
    .cpu cortex-m3
    .thumb

    .extern memoryInit

    .global __ISR_VECTOR
    .global Default_Handler

    .word _sidata
    .word _sdata
    .word _edata
    .word _sbss
    .word _ebss
    .word _estack

    .section .text.Reset_Handler
    .weak Reset_Handler
    .type Reset_Handler, %function
Reset_Handler:
    ldr sp, =_estack
    /* Init Memory */
    bl memoryInit
    /* Main function */
    bl main
    bx lr
    .size Reset_Handler, . - Reset_Handler

    .section .text.Default_Handler
    .weak Default_Handler
    .type Default_Handler, %function
Default_Handler:
    b .
    .size Default_Handler, . - Default_Handler

    .section .isr_vector,"a",%progbits
    .type __ISR_VECTOR, %object
__ISR_VECTOR:
    .word 0                             /* 0x0000 0000 */
    .word Reset_Handler                 /* 0x0000 0004 */
    .word NMI_Handler                   /* 0x0000 0008 */
    .word HardFault_Handler             /* 0x0000 000c */
    .word MemManage_Handler             /* 0x0000 0010 */
    .word BusFault_Handler              /* 0x0000 0014 */
    .word UsageFault_Handler            /* 0x0000 0018 */
    .word 0                             /* 0x0000 001c */
    .word 0                             /* 0x0000 0020 */
    .word 0                             /* 0x0000 0024 */
    .word 0                             /* 0x0000 0028 */
    .word SVCall_Handler                /* 0x0000 002c */
    .word DebugMonitor_Handler          /* 0x0000 0030 */
    .word 0                             /* 0x0000 0034 */
    .word PendSV_Handler                /* 0x0000 0038 */
    .word SysTick_Handler               /* 0x0000 003c */
    .word WWDG_Handler                  /* 0x0000 0040 */
    .word PVD_Handler                   /* 0x0000 0044 */
    .word Tamper_Handler                /* 0x0000 0048 */
    .word RTC_Handler                   /* 0x0000 004c */
    .word FLASH_Handler                 /* 0x0000 0050 */
    .word RCC_Handler                   /* 0x0000 0054 */
    .word EXTI0_Handler                 /* 0x0000 0058 */
    .word EXTI1_Handler                 /* 0x0000 005c */
    .word EXTI2_Handler                 /* 0x0000 0060 */
    .word EXTI3_Handler                 /* 0x0000 0064 */
    .word EXTI4_Handler                 /* 0x0000 0068 */
    .word DMA1_Channel1_Handler         /* 0x0000 006c */
    .word DMA1_Channel2_Handler         /* 0x0000 0070 */
    .word DMA1_Channel3_Handler         /* 0x0000 0074 */
    .word DMA1_Channel4_Handler         /* 0x0000 0078 */
    .word DMA1_Channel5_Handler         /* 0x0000 007c */
    .word DMA1_Channel6_Handler         /* 0x0000 0080 */
    .word DMA1_Channel7_Handler         /* 0x0000 0084 */
    .word ADC1_2_Handler                /* 0x0000 0088 */
    .word CAN1_TX_Handler               /* 0x0000 008c */
    .word CAN1_RX0_Handler              /* 0x0000 0090 */
    .word CAN1_RX1_Handler              /* 0x0000 0094 */
    .word CAN1_SCE_Handler              /* 0x0000 0098 */
    .word EXTI9_5_Handler               /* 0x0000 009c */
    .word TIM1_Break_Handler            /* 0x0000 00a0 */
    .word TIM1_UP_Handler               /* 0x0000 00a4 */
    .word TIM1_Comunication_Handler     /* 0x0000 00a8 */
    .word TIM1_Capture_Compare_Handler  /* 0x0000 00ac */
    .word TIM2_Handler                  /* 0x0000 00b0 */
    .word TIM3_Handler                  /* 0x0000 00b4 */
    .word TIM4_Handler                  /* 0x0000 00b8 */
    .word I2C1_EV_Handler               /* 0x0000 00bc */
    .word I2C1_ER_Handler               /* 0x0000 00c0 */
    .word I2C2_EV_Handler               /* 0x0000 00c4 */
    .word I2C2_ER_Handler               /* 0x0000 00c8 */
    .word SPI1_Handler                  /* 0x0000 00cc */
    .word SPI2_Handler                  /* 0x0000 00d0 */
    .word USART1_Handler                /* 0x0000 00d4 */
    .word USART2_Handler                /* 0x0000 00d8 */
    .word USART3_Handler                /* 0x0000 00dc */
    .word EXTI15_10_Handler             /* 0x0000 00e0 */
    .word RTCAlram_Handler              /* 0x0000 00e4 */
    .word OTG_FS_Wakeup_Handler         /* 0x0000 00e8 */
    .word 0                             /* 0x0000 00ec */
    .word 0                             /* 0x0000 0100 */
    .word 0                             /* 0x0000 0104 */
    .word TIM5_Handler                  /* 0x0000 0108 */
    .word SPI3_Handler                  /* 0x0000 010c */
    .word UART4_Handler                 /* 0x0000 0110 */
    .word UART5_Handler                 /* 0x0000 0114 */
    .word TIM6_Handler                  /* 0x0000 0118 */
    .word TIM7_Handler                  /* 0x0000 011c */
    .word DMA2_Channel1_Handler         /* 0x0000 0120 */
    .word DMA2_Channel2_Handler         /* 0x0000 0124 */
    .word DMA2_Channel3_Handler         /* 0x0000 0128 */
    .word DMA2_Channel4_Handler         /* 0x0000 012c */
    .word DMA2_Channel5_Handler         /* 0x0000 0130 */
    .word Ethernet_Handler              /* 0x0000 0134 */
    .word Ethernet_Wakeup_Handler       /* 0x0000 0138 */
    .word CAN2_TX_Handler               /* 0x0000 013c */
    .word CAN2_RX0_Handler              /* 0x0000 0140 */
    .word CAN2_RX1_Handler              /* 0x0000 0144 */
    .word CAN2_SCE_Handler              /* 0x0000 0148 */
    .word OTG_FS_Handler                /* 0x0000 014c */

    .size __ISR_VECTOR, . - __ISR_VECTOR

    .weak NMI_Handler
    .thumb_set NMI_Handler, Default_Handler

    .weak HardFault_Handler
    .thumb_set HardFault_Handler, Default_Handler

    .weak MemManage_Handler
    .thumb_set MemManage_Handler, Default_Handler

    .weak BusFault_Handler
    .thumb_set BusFault_Handler, Default_Handler

    .weak UsageFault_Handler
    .thumb_set UsageFault_Handler, Default_Handler

    .weak SVCall_Handler
    .thumb_set SVCall_Handler, Default_Handler

    .weak DebugMonitor_Handler
    .thumb_set DebugMonitor_Handler, Default_Handler

    .weak PendSV_Handler
    .thumb_set PendSV_Handler, Default_Handler

    .weak SysTick_Handler
    .thumb_set SysTick_Handler, Default_Handler

    .weak WWDG_Handler
    .thumb_set WWDG_Handler, Default_Handler

    .weak PVD_Handler
    .thumb_set PVD_Handler, Default_Handler

    .weak Tamper_Handler
    .thumb_set Tamper_Handler, Default_Handler

    .weak RTC_Handler
    .thumb_set RTC_Handler, Default_Handler

    .weak FLASH_Handler
    .thumb_set FLASH_Handler, Default_Handler

    .weak RCC_Handler
    .thumb_set RCC_Handler, Default_Handler

    .weak EXTI0_Handler
    .thumb_set EXTI0_Handler, Default_Handler

    .weak EXTI1_Handler
    .thumb_set EXTI1_Handler, Default_Handler

    .weak EXTI2_Handler
    .thumb_set EXTI2_Handler, Default_Handler

    .weak EXTI3_Handler
    .thumb_set EXTI3_Handler, Default_Handler

    .weak EXTI4_Handler
    .thumb_set EXTI4_Handler, Default_Handler

    .weak DMA1_Channel1_Handler
    .thumb_set DMA1_Channel1_Handler, Default_Handler

    .weak DMA1_Channel2_Handler
    .thumb_set DMA1_Channel2_Handler, Default_Handler

    .weak DMA1_Channel3_Handler
    .thumb_set DMA1_Channel3_Handler, Default_Handler

    .weak DMA1_Channel4_Handler
    .thumb_set DMA1_Channel4_Handler, Default_Handler

    .weak DMA1_Channel5_Handler
    .thumb_set DMA1_Channel5_Handler, Default_Handler

    .weak DMA1_Channel6_Handler
    .thumb_set DMA1_Channel6_Handler, Default_Handler

    .weak DMA1_Channel7_Handler
    .thumb_set DMA1_Channel7_Handler, Default_Handler

    .weak ADC1_2_Handler
    .thumb_set ADC1_2_Handler, Default_Handler

    .weak CAN1_TX_Handler
    .thumb_set CAN1_TX_Handler, Default_Handler

    .weak CAN1_RX0_Handler
    .thumb_set CAN1_RX0_Handler, Default_Handler

    .weak CAN1_RX1_Handler
    .thumb_set CAN1_RX1_Handler, Default_Handler

    .weak CAN1_SCE_Handler
    .thumb_set CAN1_SCE_Handler, Default_Handler

    .weak EXTI9_5_Handler
    .thumb_set EXTI9_5_Handler, Default_Handler

    .weak TIM1_Break_Handler
    .thumb_set TIM1_Break_Handler, Default_Handler

    .weak TIM1_UP_Handler
    .thumb_set TIM1_UP_Handler, Default_Handler

    .weak TIM1_Comunication_Handler
    .thumb_set TIM1_Capture_Handler, Default_Handler

    .weak TIM1_Capture_Compare_Handler
    .thumb_set TIM1_Capture_Compare_Handler, Default_Handler

    .weak TIM2_Handler
    .thumb_set TIM2_Handler, Default_Handler

    .weak TIM3_Handler
    .thumb_set TIM3_Handler, Default_Handler

    .weak TIM4_Handler
    .thumb_set TIM4_Handler, Default_Handler

    .weak I2C1_EV_Handler
    .thumb_set I2C1_EV_Handler, Default_Handler

    .weak I2C1_ER_Handler
    .thumb_set I2C1_ER_Handler, Default_Handler

    .weak I2C2_EV_Handler
    .thumb_set I2C2_EV_Handler, Default_Handler

    .weak I2C2_ER_Handler
    .thumb_set I2C2_ER_Handler, Default_Handler

    .weak SPI1_Handler
    .thumb_set SPI1_Handler, Default_Handler

    .weak SPI2_Handler
    .thumb_set SPI2_Handler, Default_Handler

    .weak USART1_Handler
    .thumb_set USART1_Handler, Default_Handler

    .weak USART2_Handler
    .thumb_set USART2_Handler, Default_Handler

    .weak USART3_Handler
    .thumb_set USART3_Handler, Default_Handler

    .weak EXTI15_10_Handler
    .thumb_set EXTI15_10_Handler, Default_Handler

    .weak RTCAlram_Handler
    .thumb_set RTCAlram_Handler, Default_Handler

    .weak OTG_FS_Wakeup_Handler
    .thumb_set OTG_FS_Wakeup_Handler, Default_Handler

    .weak TIM5_Handler
    .thumb_set TIM5_Handler, Default_Handler

    .weak SPI3_Handler
    .thumb_set SPI3_Handler, Default_Handler

    .weak UART4_Handler
    .thumb_set UART4_Handler, Default_Handler

    .weak UART5_Handler
    .thumb_set UART5_Handler, Default_Handler

    .weak TIM6_Handler
    .thumb_set TIM6_Handler, Default_Handler

    .weak TIM7_Handler
    .thumb_set TIM7_Handler, Default_Handler

    .weak DMA2_Channel1_Handler
    .thumb_set DMA2_Channel1_Handler, Default_Handler

    .weak DMA2_Channel2_Handler
    .thumb_set DMA2_Channel2_Handler, Default_Handler

    .weak DMA2_Channel3_Handler
    .thumb_set DMA2_Channel3_Handler, Default_Handler

    .weak DMA2_Channel4_Handler
    .thumb_set DMA2_Channel4_Handler, Default_Handler

    .weak DMA2_Channel5_Handler
    .thumb_set DMA2_Channel5_Handler, Default_Handler

    .weak Ethernet_Handler
    .thumb_set Ethernet_Handler, Default_Handler

    .weak Ethernet_Wakeup_Handler
    .thumb_set Ethernet_Wakeup_Handler, Default_Handler

    .weak CAN2_TX_Handler
    .thumb_set CAN2_TX_Handler, Default_Handler

    .weak CAN2_RX0_Handler
    .thumb_set CAN2_RX0_Handler, Default_Handler

    .weak CAN2_RX1_Handler
    .thumb_set CAN2_RX1_Handler, Default_Handler

    .weak CAN2_SCE_Handler
    .thumb_set CAN2_SCE_Handler, Default_Handler

    .weak OTG_FS_Handler
    .thumb_set OTG_FS_Handler, Default_Handler

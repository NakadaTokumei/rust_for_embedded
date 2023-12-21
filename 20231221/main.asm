	.text
	.syntax unified
	.eabi_attribute	67, "2.09"
	.eabi_attribute	6, 10
	.eabi_attribute	7, 77
	.eabi_attribute	8, 0
	.eabi_attribute	9, 2
	.eabi_attribute	34, 1
	.eabi_attribute	17, 1
	.eabi_attribute	20, 1
	.eabi_attribute	21, 1
	.eabi_attribute	23, 3
	.eabi_attribute	24, 1
	.eabi_attribute	25, 1
	.eabi_attribute	38, 1
	.eabi_attribute	14, 0
	.file	"main.b193166c8951d9de-cgu.0"
	.section	.text._ZN4core3ptr14write_volatile17h6150515cf73352d1E,"ax",%progbits
	.p2align	1
	.type	_ZN4core3ptr14write_volatile17h6150515cf73352d1E,%function
	.code	16
	.thumb_func
_ZN4core3ptr14write_volatile17h6150515cf73352d1E:
	.fnstart
	str	r1, [r0]
	bx	lr
.Lfunc_end0:
	.size	_ZN4core3ptr14write_volatile17h6150515cf73352d1E, .Lfunc_end0-_ZN4core3ptr14write_volatile17h6150515cf73352d1E
	.cantunwind
	.fnend

	.section	".text._ZN5manna8internal10read_write11RW$LT$T$GT$5write17h5efe4019928542c9E","ax",%progbits
	.p2align	1
	.type	_ZN5manna8internal10read_write11RW$LT$T$GT$5write17h5efe4019928542c9E,%function
	.code	16
	.thumb_func
_ZN5manna8internal10read_write11RW$LT$T$GT$5write17h5efe4019928542c9E:
	.fnstart
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	bl	_ZN4core3ptr14write_volatile17h6150515cf73352d1E
	pop	{r7, pc}
.Lfunc_end1:
	.size	_ZN5manna8internal10read_write11RW$LT$T$GT$5write17h5efe4019928542c9E, .Lfunc_end1-_ZN5manna8internal10read_write11RW$LT$T$GT$5write17h5efe4019928542c9E
	.cantunwind
	.fnend

	.section	.text.TIM6_Handler,"ax",%progbits
	.globl	TIM6_Handler
	.p2align	1
	.type	TIM6_Handler,%function
	.code	16
	.thumb_func
TIM6_Handler:
	.fnstart
	.pad	#4
	sub	sp, #4
	movs	r0, #0
	str	r0, [sp]
	ldr	r0, [sp]
	adds	r0, #1
	str	r0, [sp]
	add	sp, #4
	bx	lr
.Lfunc_end2:
	.size	TIM6_Handler, .Lfunc_end2-TIM6_Handler
	.cantunwind
	.fnend

	.section	.text.main,"ax",%progbits
	.globl	main
	.p2align	1
	.type	main,%function
	.code	16
	.thumb_func
main:
	.fnstart
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	mov	r7, sp
	.pad	#8
	sub	sp, #8
	bl	_ZN5manna10peripheral4core4nvic8get_nvic17h09dd1f0068f6c7d1E
	str	r0, [sp, #4]
	b	.LBB3_1
.LBB3_1:
	ldr	r0, [sp, #4]
	adds	r0, #80
	movs	r1, #1
	bl	_ZN5manna8internal10read_write11RW$LT$T$GT$5write17h5efe4019928542c9E
	b	.LBB3_1
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cantunwind
	.fnend

	.ident	"rustc version 1.76.0-nightly (503e12932 2023-12-07)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 5

	.file	"sort.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	rand_uns
	.type	rand_uns, @function
rand_uns:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	mv	a5,a0
	mv	a4,a1
	sw	a5,-20(s0)
	mv	a5,a4
	sw	a5,-24(s0)
	call	rand
	mv	a5,a0
	mv	a4,a5
	lw	a5,-24(s0)
	remw	a5,a4,a5
	sext.w	a5,a5
	lw	a4,-20(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	rand_uns, .-rand_uns
	.align	1
	.globl	bubbleSort
	.type	bubbleSort, @function
bubbleSort:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	mv	a5,a1
	sw	a5,-44(s0)
	li	a5,1
	sw	a5,-20(s0)
	j	.L4
.L8:
	sw	zero,-20(s0)
	li	a5,1
	sw	a5,-24(s0)
	j	.L5
.L7:
	lw	a5,-24(s0)
	slli	a5,a5,2
	addi	a5,a5,-4
	ld	a4,-40(s0)
	add	a5,a4,a5
	lw	a3,0(a5)
	lw	a5,-24(s0)
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	mv	a4,a3
	ble	a4,a5,.L6
	lw	a5,-24(s0)
	slli	a5,a5,2
	addi	a5,a5,-4
	ld	a4,-40(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a4,a4,a5
	lw	a5,-24(s0)
	slli	a5,a5,2
	addi	a5,a5,-4
	ld	a3,-40(s0)
	add	a5,a3,a5
	lw	a4,0(a4)
	sw	a4,0(a5)
	lw	a5,-24(s0)
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a5,a4,a5
	lw	a4,-28(s0)
	sw	a4,0(a5)
	li	a5,1
	sw	a5,-20(s0)
.L6:
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L5:
	lw	a5,-24(s0)
	mv	a4,a5
	lw	a5,-44(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L7
.L4:
	lw	a5,-20(s0)
	sext.w	a5,a5
	bne	a5,zero,.L8
	nop
	nop
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	bubbleSort, .-bubbleSort
	.globl	MIN_RND
	.section	.srodata,"a"
	.align	2
	.type	MIN_RND, @object
	.size	MIN_RND, 4
MIN_RND:
	.zero	4
	.globl	MAX_RND
	.align	2
	.type	MAX_RND, @object
	.size	MAX_RND, 4
MAX_RND:
	.word	10000
	.globl	test_mas
	.bss
	.align	3
	.type	test_mas, @object
	.size	test_mas, 40000
test_mas:
	.zero	40000
	.section	.rodata
	.align	3
.LC0:
	.string	"w"
	.align	3
.LC1:
	.string	"bubble_gcc.csv"
	.align	3
.LC3:
	.string	"%f\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-160
	sd	ra,152(sp)
	sd	s0,144(sp)
	addi	s0,sp,160
	lui	a5,%hi(.LC0)
	addi	a1,a5,%lo(.LC0)
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	fopen
	sd	a0,-32(s0)
	li	a5,10
	sw	a5,-20(s0)
	j	.L10
.L13:
	sw	zero,-24(s0)
	j	.L11
.L12:
	li	a4,0
	li	a5,8192
	addi	a5,a5,1808
	mv	a1,a5
	mv	a0,a4
	call	rand_uns
	mv	a5,a0
	mv	a3,a5
	lui	a5,%hi(test_mas)
	addi	a4,a5,%lo(test_mas)
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	sw	a3,0(a5)
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L11:
	lw	a5,-24(s0)
	mv	a4,a5
	lw	a5,-20(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L12
	call	clock
	sd	a0,-40(s0)
	lw	a5,-20(s0)
	mv	a1,a5
	lui	a5,%hi(test_mas)
	addi	a0,a5,%lo(test_mas)
	call	bubbleSort
	call	clock
	mv	a4,a0
	ld	a5,-40(s0)
	sub	a5,a4,a5
	sd	a5,-40(s0)
	ld	a5,-40(s0)
	fcvt.d.l	fa4,a5
	lui	a5,%hi(.LC2)
	fld	fa5,%lo(.LC2)(a5)
	fdiv.d	fa5,fa4,fa5
	fsd	fa5,-48(s0)
	addi	a4,s0,-152
	ld	a2,-48(s0)
	lui	a5,%hi(.LC3)
	addi	a1,a5,%lo(.LC3)
	mv	a0,a4
	call	sprintf
	addi	a5,s0,-152
	ld	a1,-32(s0)
	mv	a0,a5
	call	fputs
	lw	a5,-20(s0)
	addiw	a5,a5,10
	sw	a5,-20(s0)
.L10:
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,8192
	addi	a5,a5,1807
	ble	a4,a5,.L13
	ld	a0,-32(s0)
	call	fclose
	li	a5,0
	mv	a0,a5
	ld	ra,152(sp)
	ld	s0,144(sp)
	addi	sp,sp,160
	jr	ra
	.size	main, .-main
	.section	.rodata
	.align	3
.LC2:
	.word	0
	.word	1093567616
	.ident	"GCC: () 12.2.1 20221101"
	.section	.note.GNU-stack,"",@progbits

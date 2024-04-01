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
	sd	s1,8(sp)
	mv	s0,a0
	mv	s1,a1
	call	rand
	remw	a0,a0,s1
	addw	a0,a0,s0
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	rand_uns, .-rand_uns
	.align	1
	.globl	bubbleSort
	.type	bubbleSort, @function
bubbleSort:
	addiw	a2,a1,-2
	slli	a5,a2,32
	srli	a2,a5,30
	addi	a5,a0,4
	add	a2,a2,a5
	li	a7,1
	li	t1,0
	j	.L4
.L5:
	addi	a5,a5,4
	beq	a5,a2,.L10
.L6:
	lw	a4,0(a5)
	lw	a3,4(a5)
	ble	a4,a3,.L5
	sw	a3,0(a5)
	sw	a4,4(a5)
	mv	a6,a7
	j	.L5
.L10:
	beq	a6,zero,.L3
.L4:
	ble	a1,a7,.L3
	mv	a5,a0
	mv	a6,t1
	j	.L6
.L3:
	ret
	.size	bubbleSort, .-bubbleSort
	.section	.rodata.str1.8,"aMS",@progbits,1
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
	addi	sp,sp,-208
	sd	ra,200(sp)
	sd	s0,192(sp)
	sd	s1,184(sp)
	sd	s2,176(sp)
	sd	s3,168(sp)
	sd	s4,160(sp)
	sd	s5,152(sp)
	sd	s6,144(sp)
	sd	s7,136(sp)
	sd	s8,128(sp)
	fsd	fs0,120(sp)
	lui	a1,%hi(.LC0)
	addi	a1,a1,%lo(.LC0)
	lui	a0,%hi(.LC1)
	addi	a0,a0,%lo(.LC1)
	call	fopen
	mv	s4,a0
	lui	s5,%hi(test_mas)
	addi	s5,s5,%lo(test_mas)
	addi	s1,s5,40
	li	s3,10
	li	s2,8192
	addiw	s2,s2,1808
	lui	s8,%hi(test_mas)
	lui	a5,%hi(.LC2)
	fld	fs0,%lo(.LC2)(a5)
	lui	s7,%hi(.LC3)
	li	s6,8192
	addi	s6,s6,1808
	j	.L12
.L13:
	call	rand
	remw	a0,a0,s2
	sw	a0,0(s0)
	addi	s0,s0,4
	bne	s0,s1,.L13
.L15:
	call	clock
	mv	s0,a0
	mv	a1,s3
	addi	a0,s8,%lo(test_mas)
	call	bubbleSort
	call	clock
	sub	a0,a0,s0
	fcvt.d.l	fa5,a0
	fdiv.d	fa5,fa5,fs0
	fmv.x.d	a2,fa5
	addi	a1,s7,%lo(.LC3)
	addi	a0,sp,8
	call	sprintf
	mv	a1,s4
	addi	a0,sp,8
	call	fputs
	addiw	s3,s3,10
	addi	s1,s1,40
	beq	s3,s6,.L14
.L12:
	mv	s0,s5
	bgt	s3,zero,.L13
	j	.L15
.L14:
	mv	a0,s4
	call	fclose
	li	a0,0
	ld	ra,200(sp)
	ld	s0,192(sp)
	ld	s1,184(sp)
	ld	s2,176(sp)
	ld	s3,168(sp)
	ld	s4,160(sp)
	ld	s5,152(sp)
	ld	s6,144(sp)
	ld	s7,136(sp)
	ld	s8,128(sp)
	fld	fs0,120(sp)
	addi	sp,sp,208
	jr	ra
	.size	main, .-main
	.globl	test_mas
	.globl	MAX_RND
	.globl	MIN_RND
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC2:
	.word	0
	.word	1093567616
	.bss
	.align	3
	.type	test_mas, @object
	.size	test_mas, 40000
test_mas:
	.zero	40000
	.section	.srodata,"a"
	.align	2
	.type	MAX_RND, @object
	.size	MAX_RND, 4
MAX_RND:
	.word	10000
	.type	MIN_RND, @object
	.size	MIN_RND, 4
MIN_RND:
	.zero	4
	.ident	"GCC: () 12.2.1 20221101"
	.section	.note.GNU-stack,"",@progbits

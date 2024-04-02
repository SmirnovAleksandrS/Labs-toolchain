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
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	ra,24(sp)
	mv	s0,a0
	mv	s1,a1
	call	rand
	remw	a0,a0,s1
	ld	ra,24(sp)
	ld	s1,8(sp)
	addw	a0,a0,s0
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	rand_uns, .-rand_uns
	.align	1
	.globl	bubbleSort
	.type	bubbleSort, @function
bubbleSort:
	li	a5,1
	ble	a1,a5,.L4
	addiw	a2,a1,-2
	slli	a5,a2,32
	srli	a2,a5,30
	addi	a5,a0,4
	add	a2,a2,a5
.L9:
	mv	a5,a0
	li	a1,0
.L7:
	lw	a4,0(a5)
	lw	a3,4(a5)
	ble	a4,a3,.L6
	sw	a3,0(a5)
	sw	a4,4(a5)
	li	a1,1
.L6:
	addi	a5,a5,4
	bne	a5,a2,.L7
	bne	a1,zero,.L9
.L4:
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
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	lui	a1,%hi(.LC0)
	lui	a0,%hi(.LC1)
	addi	sp,sp,-208
	addi	a1,a1,%lo(.LC0)
	addi	a0,a0,%lo(.LC1)
	sd	s1,184(sp)
	sd	s2,176(sp)
	sd	s3,168(sp)
	sd	s4,160(sp)
	sd	s5,152(sp)
	sd	s6,144(sp)
	sd	s7,136(sp)
	fsd	fs0,120(sp)
	sd	ra,200(sp)
	sd	s0,192(sp)
	sd	s8,128(sp)
	call	fopen
	lui	a5,%hi(.LC2)
	lui	s3,%hi(test_mas)
	li	s5,40960
	fld	fs0,%lo(.LC2)(a5)
	addi	s3,s3,%lo(test_mas)
	addi	s5,s5,-964
	li	s4,8192
	mv	s6,a0
	addi	s1,s3,36
	addi	s2,s3,40
	add	s5,s3,s5
	lui	s7,%hi(.LC3)
	addiw	s4,s4,1808
.L13:
	mv	s0,s3
.L14:
	call	rand
	remw	a0,a0,s4
	addi	s0,s0,4
	sw	a0,-4(s0)
	bne	s0,s2,.L14
	call	clock
	mv	s8,a0
.L15:
	mv	s0,s3
	li	a3,0
.L17:
	lw	a5,0(s0)
	lw	a4,4(s0)
	ble	a5,a4,.L16
	sw	a4,0(s0)
	sw	a5,4(s0)
	li	a3,1
.L16:
	addi	s0,s0,4
	bne	s0,s1,.L17
	bne	a3,zero,.L15
	call	clock
	sub	a5,a0,s8
	fcvt.d.l	fa5,a5
	addi	a1,s7,%lo(.LC3)
	addi	a0,sp,8
	fdiv.d	fa5,fa5,fs0
	addi	s1,s0,40
	addi	s2,s2,40
	fmv.x.d	a2,fa5
	call	sprintf
	mv	a1,s6
	addi	a0,sp,8
	call	fputs
	bne	s1,s5,.L13
	mv	a0,s6
	call	fclose
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
	li	a0,0
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

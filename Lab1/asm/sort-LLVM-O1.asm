	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0"
	.file	"sort.c"
	.globl	rand_uns                        # -- Begin function rand_uns
	.p2align	2
	.type	rand_uns,@function
rand_uns:                               # @rand_uns
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	sd	s1, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	mv	s0, a1
	mv	s1, a0
	call	rand@plt
	remw	a0, a0, s0
	addw	a0, a0, s1
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	rand_uns, .Lfunc_end0-rand_uns
	.cfi_endproc
                                        # -- End function
	.globl	bubbleSort                      # -- Begin function bubbleSort
	.p2align	2
	.type	bubbleSort,@function
bubbleSort:                             # @bubbleSort
	.cfi_startproc
# %bb.0:
	slli	a2, a1, 32
	srli	a2, a2, 32
	addi	a7, a0, 4
	addi	t0, a2, -1
	li	a6, 2
	j	.LBB1_2
	.p2align	4
.LBB1_1:                                #   in Loop: Header=BB1_2 Depth=1
	beqz	a4, .LBB1_7
.LBB1_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_5 Depth 2
	li	a4, 0
	blt	a1, a6, .LBB1_1
# %bb.3:                                #   in Loop: Header=BB1_2 Depth=1
	mv	a5, t0
	mv	a0, a7
	j	.LBB1_5
	.p2align	4
.LBB1_4:                                #   in Loop: Header=BB1_5 Depth=2
	addi	a5, a5, -1
	addi	a0, a0, 4
	beqz	a5, .LBB1_1
.LBB1_5:                                #   Parent Loop BB1_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a3, -4(a0)
	lw	a2, 0(a0)
	bge	a2, a3, .LBB1_4
# %bb.6:                                #   in Loop: Header=BB1_5 Depth=2
	sw	a2, -4(a0)
	sw	a3, 0(a0)
	li	a4, 1
	j	.LBB1_4
.LBB1_7:
	ret
.Lfunc_end1:
	.size	bubbleSort, .Lfunc_end1-bubbleSort
	.cfi_endproc
                                        # -- End function
	.section	.sdata,"aw",@progbits
	.p2align	3                               # -- Begin function main
.LCPI2_0:
	.quad	0x412e848000000000              # double 1.0E+6
	.text
	.globl	main
	.p2align	2
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -208
	.cfi_def_cfa_offset 208
	sd	ra, 200(sp)                     # 8-byte Folded Spill
	sd	s0, 192(sp)                     # 8-byte Folded Spill
	sd	s1, 184(sp)                     # 8-byte Folded Spill
	sd	s2, 176(sp)                     # 8-byte Folded Spill
	sd	s3, 168(sp)                     # 8-byte Folded Spill
	sd	s4, 160(sp)                     # 8-byte Folded Spill
	sd	s5, 152(sp)                     # 8-byte Folded Spill
	sd	s6, 144(sp)                     # 8-byte Folded Spill
	sd	s7, 136(sp)                     # 8-byte Folded Spill
	sd	s8, 128(sp)                     # 8-byte Folded Spill
	sd	s9, 120(sp)                     # 8-byte Folded Spill
	fsd	fs0, 112(sp)                    # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	.cfi_offset s4, -48
	.cfi_offset s5, -56
	.cfi_offset s6, -64
	.cfi_offset s7, -72
	.cfi_offset s8, -80
	.cfi_offset s9, -88
	.cfi_offset fs0, -96
.Lpcrel_hi0:
	auipc	a0, %pcrel_hi(.L.str)
.Lpcrel_hi1:
	auipc	a1, %pcrel_hi(.L.str.1)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi0)
	addi	a1, a1, %pcrel_lo(.Lpcrel_hi1)
	call	fopen@plt
	mv	s2, a0
	li	a0, 10
.Lpcrel_hi2:
	auipc	a1, %pcrel_hi(test_mas)
	addi	s8, a1, %pcrel_lo(.Lpcrel_hi2)
	lui	a1, 429497
	addiw	s5, a1, -1107
.Lpcrel_hi3:
	auipc	a1, %pcrel_hi(.LCPI2_0)
	lui	a2, 2
	fld	fs0, %pcrel_lo(.Lpcrel_hi3)(a1)
	addiw	s7, a2, 1808
.Lpcrel_hi4:
	auipc	a1, %pcrel_hi(.L.str.2)
	addi	s3, a1, %pcrel_lo(.Lpcrel_hi4)
	addiw	s6, a2, 1798
	.p2align	4
.LBB2_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
                                        #     Child Loop BB2_4 Depth 2
	mv	s9, a0
	mv	s1, a0
	mv	s0, s8
	.p2align	4
.LBB2_2:                                #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	call	rand@plt
	mul	a1, a0, s5
	srli	a2, a1, 63
	srai	a1, a1, 44
	add	a1, a1, a2
	mul	a1, a1, s7
	subw	a0, a0, a1
	addi	s1, s1, -1
	sw	a0, 0(s0)
	addi	s0, s0, 4
	bnez	s1, .LBB2_2
# %bb.3:                                #   in Loop: Header=BB2_1 Depth=1
	li	s1, 1
	call	clock@plt
	mv	s4, a0
	li	a0, 0
	.p2align	4
.LBB2_4:                                #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a2, s1, 2
	add	a2, a2, s8
	lw	a3, -4(a2)
	lw	a4, 0(a2)
	mv	a1, a0
	bge	a4, a3, .LBB2_6
# %bb.5:                                #   in Loop: Header=BB2_4 Depth=2
	addi	a0, a2, -4
	sw	a4, 0(a0)
	li	a1, 1
	sw	a3, 0(a2)
	mv	a0, a1
.LBB2_6:                                #   in Loop: Header=BB2_4 Depth=2
	addi	s1, s1, 1
	bne	s1, s9, .LBB2_4
# %bb.7:                                #   in Loop: Header=BB2_4 Depth=2
	li	a0, 0
	li	s1, 1
	bnez	a1, .LBB2_4
# %bb.8:                                #   in Loop: Header=BB2_1 Depth=1
	call	clock@plt
	sub	a0, a0, s4
	fcvt.d.l	fa5, a0
	fdiv.d	fa5, fa5, fs0
	fmv.x.d	a2, fa5
	addi	a0, sp, 12
	mv	a1, s3
	call	sprintf@plt
	addi	a0, sp, 12
	mv	a1, s2
	call	fputs@plt
	addi	a0, s9, 10
	bltu	s9, s6, .LBB2_1
# %bb.9:
	mv	a0, s2
	call	fclose@plt
	li	a0, 0
	ld	ra, 200(sp)                     # 8-byte Folded Reload
	ld	s0, 192(sp)                     # 8-byte Folded Reload
	ld	s1, 184(sp)                     # 8-byte Folded Reload
	ld	s2, 176(sp)                     # 8-byte Folded Reload
	ld	s3, 168(sp)                     # 8-byte Folded Reload
	ld	s4, 160(sp)                     # 8-byte Folded Reload
	ld	s5, 152(sp)                     # 8-byte Folded Reload
	ld	s6, 144(sp)                     # 8-byte Folded Reload
	ld	s7, 136(sp)                     # 8-byte Folded Reload
	ld	s8, 128(sp)                     # 8-byte Folded Reload
	ld	s9, 120(sp)                     # 8-byte Folded Reload
	fld	fs0, 112(sp)                    # 8-byte Folded Reload
	addi	sp, sp, 208
	ret
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        # -- End function
	.type	MIN_RND,@object                 # @MIN_RND
	.section	.rodata,"a",@progbits
	.globl	MIN_RND
	.p2align	2, 0x0
MIN_RND:
	.word	0                               # 0x0
	.size	MIN_RND, 4

	.type	MAX_RND,@object                 # @MAX_RND
	.globl	MAX_RND
	.p2align	2, 0x0
MAX_RND:
	.word	10000                           # 0x2710
	.size	MAX_RND, 4

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"bubble_gcc.csv"
	.size	.L.str, 15

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"w"
	.size	.L.str.1, 2

	.type	test_mas,@object                # @test_mas
	.bss
	.globl	test_mas
	.p2align	2, 0x0
test_mas:
	.zero	40000
	.size	test_mas, 40000

	.type	.L.str.2,@object                # @.str.2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.2:
	.asciz	"%f\n"
	.size	.L.str.2, 4

	.ident	"Syntacore clang version 17.0.0 (SC git:/tools/llvm/llvm-project/ 8e902e1e697c9e34f6e4e91bf560a764435008a2)"
	.section	".note.GNU-stack","",@progbits
	.addrsig

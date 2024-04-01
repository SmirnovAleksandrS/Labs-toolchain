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
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
                                        # kill: def $x12 killed $x11
                                        # kill: def $x12 killed $x10
	sw	a0, -20(s0)
	sw	a1, -24(s0)
	lw	a0, -20(s0)
	sd	a0, -32(s0)                     # 8-byte Folded Spill
	call	rand@plt
	mv	a1, a0
	ld	a0, -32(s0)                     # 8-byte Folded Reload
	lw	a2, -24(s0)
	remw	a1, a1, a2
	addw	a0, a0, a1
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
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
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 48
	.cfi_def_cfa s0, 0
                                        # kill: def $x12 killed $x11
	sd	a0, -24(s0)
	sw	a1, -28(s0)
	li	a0, 1
	sw	a0, -32(s0)
	j	.LBB1_1
.LBB1_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	lw	a0, -32(s0)
	beqz	a0, .LBB1_9
	j	.LBB1_2
.LBB1_2:                                #   in Loop: Header=BB1_1 Depth=1
	li	a0, 0
	sw	a0, -32(s0)
	li	a0, 1
	sw	a0, -36(s0)
	j	.LBB1_3
.LBB1_3:                                #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -36(s0)
	lw	a1, -28(s0)
	bge	a0, a1, .LBB1_8
	j	.LBB1_4
.LBB1_4:                                #   in Loop: Header=BB1_3 Depth=2
	ld	a0, -24(s0)
	lw	a2, -36(s0)
	addiw	a1, a2, -1
	slli	a1, a1, 2
	add	a1, a1, a0
	lw	a1, 0(a1)
	slli	a2, a2, 2
	add	a0, a0, a2
	lw	a0, 0(a0)
	bge	a0, a1, .LBB1_6
	j	.LBB1_5
.LBB1_5:                                #   in Loop: Header=BB1_3 Depth=2
	ld	a0, -24(s0)
	lw	a1, -36(s0)
	addiw	a1, a1, -1
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	sw	a0, -40(s0)
	ld	a1, -24(s0)
	lw	a2, -36(s0)
	slli	a0, a2, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	addiw	a2, a2, -1
	slli	a2, a2, 2
	add	a1, a1, a2
	sw	a0, 0(a1)
	lw	a0, -40(s0)
	ld	a1, -24(s0)
	lw	a2, -36(s0)
	slli	a2, a2, 2
	add	a1, a1, a2
	sw	a0, 0(a1)
	li	a0, 1
	sw	a0, -32(s0)
	j	.LBB1_6
.LBB1_6:                                #   in Loop: Header=BB1_3 Depth=2
	j	.LBB1_7
.LBB1_7:                                #   in Loop: Header=BB1_3 Depth=2
	lw	a0, -36(s0)
	addiw	a0, a0, 1
	sw	a0, -36(s0)
	j	.LBB1_3
.LBB1_8:                                #   in Loop: Header=BB1_1 Depth=1
	j	.LBB1_1
.LBB1_9:
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 48
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
	addi	sp, sp, -176
	.cfi_def_cfa_offset 176
	sd	ra, 168(sp)                     # 8-byte Folded Spill
	sd	s0, 160(sp)                     # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 176
	.cfi_def_cfa s0, 0
	li	a0, 0
	sw	a0, -20(s0)
.Lpcrel_hi0:
	auipc	a0, %pcrel_hi(.L.str)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi0)
.Lpcrel_hi1:
	auipc	a1, %pcrel_hi(.L.str.1)
	addi	a1, a1, %pcrel_lo(.Lpcrel_hi1)
	call	fopen@plt
	sd	a0, -32(s0)
	li	a0, 10
	sw	a0, -36(s0)
	j	.LBB2_1
.LBB2_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_3 Depth 2
	lw	a1, -36(s0)
	lui	a0, 2
	addiw	a0, a0, 1807
	blt	a0, a1, .LBB2_8
	j	.LBB2_2
.LBB2_2:                                #   in Loop: Header=BB2_1 Depth=1
	li	a0, 0
	sw	a0, -40(s0)
	j	.LBB2_3
.LBB2_3:                                #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -40(s0)
	lw	a1, -36(s0)
	bge	a0, a1, .LBB2_6
	j	.LBB2_4
.LBB2_4:                                #   in Loop: Header=BB2_3 Depth=2
	lui	a0, 2
	addiw	a1, a0, 1808
	li	a0, 0
	call	rand_uns
	lw	a1, -40(s0)
	slli	a2, a1, 2
.Lpcrel_hi2:
	auipc	a1, %pcrel_hi(test_mas)
	addi	a1, a1, %pcrel_lo(.Lpcrel_hi2)
	add	a1, a1, a2
	sw	a0, 0(a1)
	j	.LBB2_5
.LBB2_5:                                #   in Loop: Header=BB2_3 Depth=2
	lw	a0, -40(s0)
	addiw	a0, a0, 1
	sw	a0, -40(s0)
	j	.LBB2_3
.LBB2_6:                                #   in Loop: Header=BB2_1 Depth=1
	call	clock@plt
	sd	a0, -48(s0)
	lw	a1, -36(s0)
.Lpcrel_hi3:
	auipc	a0, %pcrel_hi(test_mas)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi3)
	call	bubbleSort
	call	clock@plt
	ld	a1, -48(s0)
	sub	a0, a0, a1
	sd	a0, -48(s0)
	ld	a0, -48(s0)
	fcvt.d.l	fa5, a0
.Lpcrel_hi4:
	auipc	a0, %pcrel_hi(.LCPI2_0)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi4)
	fld	fa4, 0(a0)
	fdiv.d	fa5, fa5, fa4
	fsd	fa5, -56(s0)
	ld	a2, -56(s0)
.Lpcrel_hi5:
	auipc	a0, %pcrel_hi(.L.str.2)
	addi	a1, a0, %pcrel_lo(.Lpcrel_hi5)
	addi	a0, s0, -156
	sd	a0, -168(s0)                    # 8-byte Folded Spill
	call	sprintf@plt
                                        # kill: def $x11 killed $x10
	ld	a0, -168(s0)                    # 8-byte Folded Reload
	ld	a1, -32(s0)
	call	fputs@plt
	j	.LBB2_7
.LBB2_7:                                #   in Loop: Header=BB2_1 Depth=1
	lw	a0, -36(s0)
	addiw	a0, a0, 10
	sw	a0, -36(s0)
	j	.LBB2_1
.LBB2_8:
	ld	a0, -32(s0)
	call	fclose@plt
	lw	a0, -20(s0)
	ld	ra, 168(sp)                     # 8-byte Folded Reload
	ld	s0, 160(sp)                     # 8-byte Folded Reload
	addi	sp, sp, 176
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
	.addrsig_sym rand_uns
	.addrsig_sym rand
	.addrsig_sym bubbleSort
	.addrsig_sym fopen
	.addrsig_sym clock
	.addrsig_sym sprintf
	.addrsig_sym fputs
	.addrsig_sym fclose
	.addrsig_sym test_mas

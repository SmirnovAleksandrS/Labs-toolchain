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
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	addw	a0, a0, s1
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
	li	a6, 2
	blt	a1, a6, .LBB1_45
# %bb.1:
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sd	s0, 40(sp)                      # 8-byte Folded Spill
	sd	s1, 32(sp)                      # 8-byte Folded Spill
	sd	s2, 24(sp)                      # 8-byte Folded Spill
	sd	s3, 16(sp)                      # 8-byte Folded Spill
	sd	s4, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset s0, -8
	.cfi_offset s1, -16
	.cfi_offset s2, -24
	.cfi_offset s3, -32
	.cfi_offset s4, -40
	addi	a2, a1, -1
	addi	t5, a1, -2
	andi	a3, a2, -8
	andi	s2, a2, 7
	neg	a5, a3
	addi	t0, a0, 16
	li	a7, 7
	slti	t6, a1, 2
	li	a2, 1
	li	t1, 3
	li	t2, 4
	li	t3, 5
	li	t4, 6
	j	.LBB1_3
	.p2align	4
.LBB1_2:                                #   in Loop: Header=BB1_3 Depth=1
	sext.w	a1, a1
	seqz	a1, a1
	or	a1, a1, t6
	bnez	a1, .LBB1_44
.LBB1_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_10 Depth 2
	lw	a3, 0(a0)
	li	a1, 0
	li	s0, 1
	bgeu	t5, a7, .LBB1_7
.LBB1_4:                                #   in Loop: Header=BB1_3 Depth=1
	beqz	s2, .LBB1_2
# %bb.5:                                #   in Loop: Header=BB1_3 Depth=1
	slli	s4, s0, 2
	add	s4, s4, a0
	lw	a4, 0(s4)
	bge	a4, a3, .LBB1_26
# %bb.6:                                #   in Loop: Header=BB1_3 Depth=1
	li	a1, 1
	sw	a4, -4(s4)
	sw	a3, 0(s4)
	beq	s2, a2, .LBB1_2
	j	.LBB1_27
	.p2align	4
.LBB1_7:                                #   in Loop: Header=BB1_3 Depth=1
	mv	s1, t0
	j	.LBB1_10
	.p2align	4
.LBB1_8:                                #   in Loop: Header=BB1_10 Depth=2
	li	a1, 1
	sw	a4, 12(s1)
	sw	a3, 16(s1)
.LBB1_9:                                #   in Loop: Header=BB1_10 Depth=2
	addi	s0, s0, 8
	addi	s1, s1, 32
	add	a4, a5, s0
	beq	a4, a2, .LBB1_4
.LBB1_10:                               #   Parent Loop BB1_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a4, -12(s1)
	bge	a4, a3, .LBB1_18
# %bb.11:                               #   in Loop: Header=BB1_10 Depth=2
	li	a1, 1
	sw	a4, -16(s1)
	sw	a3, -12(s1)
	lw	a4, -8(s1)
	blt	a4, a3, .LBB1_19
.LBB1_12:                               #   in Loop: Header=BB1_10 Depth=2
	mv	a3, a4
	lw	a4, -4(s1)
	blt	a4, a3, .LBB1_20
.LBB1_13:                               #   in Loop: Header=BB1_10 Depth=2
	mv	a3, a4
	lw	a4, 0(s1)
	blt	a4, a3, .LBB1_21
.LBB1_14:                               #   in Loop: Header=BB1_10 Depth=2
	mv	a3, a4
	lw	a4, 4(s1)
	blt	a4, a3, .LBB1_22
.LBB1_15:                               #   in Loop: Header=BB1_10 Depth=2
	mv	a3, a4
	lw	a4, 8(s1)
	blt	a4, a3, .LBB1_23
.LBB1_16:                               #   in Loop: Header=BB1_10 Depth=2
	mv	a3, a4
	lw	a4, 12(s1)
	blt	a4, a3, .LBB1_24
.LBB1_17:                               #   in Loop: Header=BB1_10 Depth=2
	mv	a3, a4
	lw	a4, 16(s1)
	blt	a4, a3, .LBB1_8
	j	.LBB1_25
	.p2align	4
.LBB1_18:                               #   in Loop: Header=BB1_10 Depth=2
	mv	a3, a4
	lw	a4, -8(s1)
	bge	a4, a3, .LBB1_12
.LBB1_19:                               #   in Loop: Header=BB1_10 Depth=2
	li	a1, 1
	sw	a4, -12(s1)
	sw	a3, -8(s1)
	lw	a4, -4(s1)
	bge	a4, a3, .LBB1_13
.LBB1_20:                               #   in Loop: Header=BB1_10 Depth=2
	li	a1, 1
	sw	a4, -8(s1)
	sw	a3, -4(s1)
	lw	a4, 0(s1)
	bge	a4, a3, .LBB1_14
.LBB1_21:                               #   in Loop: Header=BB1_10 Depth=2
	li	a1, 1
	sw	a4, -4(s1)
	sw	a3, 0(s1)
	lw	a4, 4(s1)
	bge	a4, a3, .LBB1_15
.LBB1_22:                               #   in Loop: Header=BB1_10 Depth=2
	li	a1, 1
	sw	a4, 0(s1)
	sw	a3, 4(s1)
	lw	a4, 8(s1)
	bge	a4, a3, .LBB1_16
.LBB1_23:                               #   in Loop: Header=BB1_10 Depth=2
	li	a1, 1
	sw	a4, 4(s1)
	sw	a3, 8(s1)
	lw	a4, 12(s1)
	bge	a4, a3, .LBB1_17
.LBB1_24:                               #   in Loop: Header=BB1_10 Depth=2
	li	a1, 1
	sw	a4, 8(s1)
	sw	a3, 12(s1)
	lw	a4, 16(s1)
	blt	a4, a3, .LBB1_8
.LBB1_25:                               #   in Loop: Header=BB1_10 Depth=2
	mv	a3, a4
	j	.LBB1_9
	.p2align	4
.LBB1_26:                               #   in Loop: Header=BB1_3 Depth=1
	mv	a3, a4
	beq	s2, a2, .LBB1_2
.LBB1_27:                               #   in Loop: Header=BB1_3 Depth=1
	addi	a4, s0, 1
	slli	a4, a4, 2
	add	a4, a4, a0
	lw	s1, 0(a4)
	bge	s1, a3, .LBB1_29
# %bb.28:                               #   in Loop: Header=BB1_3 Depth=1
	li	a1, 1
	sw	s1, 0(s4)
	sw	a3, 0(a4)
	beq	s2, a6, .LBB1_2
	j	.LBB1_30
.LBB1_29:                               #   in Loop: Header=BB1_3 Depth=1
	mv	a3, s1
	beq	s2, a6, .LBB1_2
.LBB1_30:                               #   in Loop: Header=BB1_3 Depth=1
	addi	s1, s0, 2
	slli	s1, s1, 2
	add	s3, a0, s1
	lw	s1, 0(s3)
	bge	s1, a3, .LBB1_32
# %bb.31:                               #   in Loop: Header=BB1_3 Depth=1
	li	a1, 1
	sw	s1, 0(a4)
	sw	a3, 0(s3)
	beq	s2, t1, .LBB1_2
	j	.LBB1_33
.LBB1_32:                               #   in Loop: Header=BB1_3 Depth=1
	mv	a3, s1
	beq	s2, t1, .LBB1_2
.LBB1_33:                               #   in Loop: Header=BB1_3 Depth=1
	addi	a4, s0, 3
	slli	a4, a4, 2
	add	a4, a4, a0
	lw	s1, 0(a4)
	bge	s1, a3, .LBB1_35
# %bb.34:                               #   in Loop: Header=BB1_3 Depth=1
	li	a1, 1
	sw	s1, 0(s3)
	sw	a3, 0(a4)
	beq	s2, t2, .LBB1_2
	j	.LBB1_36
.LBB1_35:                               #   in Loop: Header=BB1_3 Depth=1
	mv	a3, s1
	beq	s2, t2, .LBB1_2
.LBB1_36:                               #   in Loop: Header=BB1_3 Depth=1
	addi	s1, s0, 4
	slli	s1, s1, 2
	add	s3, a0, s1
	lw	s1, 0(s3)
	bge	s1, a3, .LBB1_38
# %bb.37:                               #   in Loop: Header=BB1_3 Depth=1
	li	a1, 1
	sw	s1, 0(a4)
	sw	a3, 0(s3)
	beq	s2, t3, .LBB1_2
	j	.LBB1_39
.LBB1_38:                               #   in Loop: Header=BB1_3 Depth=1
	mv	a3, s1
	beq	s2, t3, .LBB1_2
.LBB1_39:                               #   in Loop: Header=BB1_3 Depth=1
	addi	s0, s0, 5
	slli	a4, s0, 2
	add	a4, a4, a0
	lw	s0, 0(a4)
	bge	s0, a3, .LBB1_41
# %bb.40:                               #   in Loop: Header=BB1_3 Depth=1
	li	a1, 1
	sw	s0, 0(s3)
	sw	a3, 0(a4)
	beq	s2, t4, .LBB1_2
	j	.LBB1_42
.LBB1_41:                               #   in Loop: Header=BB1_3 Depth=1
	mv	a3, s0
	beq	s2, t4, .LBB1_2
.LBB1_42:                               #   in Loop: Header=BB1_3 Depth=1
	lw	s0, 24(s4)
	bge	s0, a3, .LBB1_2
# %bb.43:                               #   in Loop: Header=BB1_3 Depth=1
	li	a1, 1
	addi	s4, s4, 24
	sw	s0, 0(a4)
	sw	a3, 0(s4)
	j	.LBB1_2
.LBB1_44:
	ld	s0, 40(sp)                      # 8-byte Folded Reload
	ld	s1, 32(sp)                      # 8-byte Folded Reload
	ld	s2, 24(sp)                      # 8-byte Folded Reload
	ld	s3, 16(sp)                      # 8-byte Folded Reload
	ld	s4, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 48
.LBB1_45:
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
	addi	sp, sp, -256
	.cfi_def_cfa_offset 256
	sd	ra, 248(sp)                     # 8-byte Folded Spill
	sd	s0, 240(sp)                     # 8-byte Folded Spill
	sd	s1, 232(sp)                     # 8-byte Folded Spill
	sd	s2, 224(sp)                     # 8-byte Folded Spill
	sd	s3, 216(sp)                     # 8-byte Folded Spill
	sd	s4, 208(sp)                     # 8-byte Folded Spill
	sd	s5, 200(sp)                     # 8-byte Folded Spill
	sd	s6, 192(sp)                     # 8-byte Folded Spill
	sd	s7, 184(sp)                     # 8-byte Folded Spill
	sd	s8, 176(sp)                     # 8-byte Folded Spill
	sd	s9, 168(sp)                     # 8-byte Folded Spill
	sd	s10, 160(sp)                    # 8-byte Folded Spill
	sd	s11, 152(sp)                    # 8-byte Folded Spill
	fsd	fs0, 144(sp)                    # 8-byte Folded Spill
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
	.cfi_offset s10, -96
	.cfi_offset s11, -104
	.cfi_offset fs0, -112
.Lpcrel_hi0:
	auipc	a0, %pcrel_hi(.L.str)
.Lpcrel_hi1:
	auipc	a1, %pcrel_hi(.L.str.1)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi0)
	addi	a1, a1, %pcrel_lo(.Lpcrel_hi1)
	call	fopen@plt
	sd	a0, 24(sp)                      # 8-byte Folded Spill
.Lpcrel_hi2:
	auipc	a0, %pcrel_hi(test_mas)
.Lpcrel_hi3:
	auipc	a1, %pcrel_hi(.LCPI2_0)
	addi	s5, a0, %pcrel_lo(.Lpcrel_hi2)
.Lpcrel_hi4:
	auipc	a0, %pcrel_hi(.L.str.2)
	fld	fs0, %pcrel_lo(.Lpcrel_hi3)(a1)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi4)
	lui	a1, 2
	sd	a0, 16(sp)                      # 8-byte Folded Spill
	addiw	a0, a1, 1798
	sd	a0, 8(sp)                       # 8-byte Folded Spill
	lui	a0, 429497
	addiw	s9, a0, -1107
	li	s6, 0
	li	s11, 1
	li	s7, 9
	li	s8, 7
	li	s2, 1
	li	a0, 10
	j	.LBB2_2
	.p2align	4
.LBB2_1:                                #   in Loop: Header=BB2_2 Depth=1
	call	clock@plt
	sub	a0, a0, s10
	ld	a1, 16(sp)                      # 8-byte Folded Reload
	fcvt.d.l	fa5, a0
	addi	a0, sp, 44
	fdiv.d	fa5, fa5, fs0
	fmv.x.d	a2, fa5
	call	sprintf@plt
	ld	a1, 24(sp)                      # 8-byte Folded Reload
	addi	a0, sp, 44
	call	fputs@plt
	ld	a2, 32(sp)                      # 8-byte Folded Reload
	addi	s6, s6, 1
	ld	a1, 8(sp)                       # 8-byte Folded Reload
	addi	s2, s2, 1
	addi	s7, s7, 10
	addi	a0, a2, 10
	bgeu	a2, a1, .LBB2_51
.LBB2_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_4 Depth 2
                                        #     Child Loop BB2_8 Depth 2
                                        #     Child Loop BB2_11 Depth 2
                                        #       Child Loop BB2_18 Depth 3
	lui	a2, 2
	mv	a3, a0
	addi	a1, a0, -1
	li	a0, 0
	addiw	s10, a2, 1808
	sd	a3, 32(sp)                      # 8-byte Folded Spill
	bltu	a1, s8, .LBB2_6
# %bb.3:                                #   in Loop: Header=BB2_2 Depth=1
	andi	a0, a3, -8
	li	s4, 0
	neg	s3, a0
	addi	s0, s5, 16
	.p2align	4
.LBB2_4:                                #   Parent Loop BB2_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	call	rand@plt
	mul	a1, a0, s9
	srai	a2, a1, 32
	srli	a1, a1, 63
	srli	a2, a2, 12
	add	a1, a1, a2
	mul	a1, a1, s10
	subw	a0, a0, a1
	sw	a0, -16(s0)
	call	rand@plt
	mul	a1, a0, s9
	srai	a2, a1, 32
	srli	a1, a1, 63
	srli	a2, a2, 12
	add	a1, a1, a2
	mul	a1, a1, s10
	subw	a0, a0, a1
	sw	a0, -12(s0)
	call	rand@plt
	mul	a1, a0, s9
	srai	a2, a1, 32
	srli	a1, a1, 63
	srli	a2, a2, 12
	add	a1, a1, a2
	mul	a1, a1, s10
	subw	a0, a0, a1
	sw	a0, -8(s0)
	call	rand@plt
	mul	a1, a0, s9
	srai	a2, a1, 32
	srli	a1, a1, 63
	srli	a2, a2, 12
	add	a1, a1, a2
	mul	a1, a1, s10
	subw	a0, a0, a1
	sw	a0, -4(s0)
	call	rand@plt
	mul	a1, a0, s9
	srai	a2, a1, 32
	srli	a1, a1, 63
	srli	a2, a2, 12
	add	a1, a1, a2
	mul	a1, a1, s10
	subw	a0, a0, a1
	sw	a0, 0(s0)
	call	rand@plt
	mul	a1, a0, s9
	srai	a2, a1, 32
	srli	a1, a1, 63
	srli	a2, a2, 12
	add	a1, a1, a2
	mul	a1, a1, s10
	subw	a0, a0, a1
	sw	a0, 4(s0)
	call	rand@plt
	mul	a1, a0, s9
	srai	a2, a1, 32
	srli	a1, a1, 63
	srli	a2, a2, 12
	add	a1, a1, a2
	mul	a1, a1, s10
	subw	a0, a0, a1
	sw	a0, 8(s0)
	call	rand@plt
	mul	a1, a0, s9
	addi	s4, s4, -8
	srai	a2, a1, 32
	srli	a1, a1, 63
	srli	a2, a2, 12
	add	a1, a1, a2
	mul	a1, a1, s10
	subw	a0, a0, a1
	sw	a0, 12(s0)
	addi	s0, s0, 32
	bne	s3, s4, .LBB2_4
# %bb.5:                                #   in Loop: Header=BB2_2 Depth=1
	ld	a3, 32(sp)                      # 8-byte Folded Reload
	neg	a0, s4
.LBB2_6:                                #   in Loop: Header=BB2_2 Depth=1
	andi	a1, a3, 6
	beqz	a1, .LBB2_9
# %bb.7:                                #   in Loop: Header=BB2_2 Depth=1
	andi	s0, s2, 3
	slli	a0, a0, 2
	slli	s0, s0, 1
	add	s1, s5, a0
	.p2align	4
.LBB2_8:                                #   Parent Loop BB2_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	call	rand@plt
	mul	a1, a0, s9
	addi	s0, s0, -1
	srli	a2, a1, 63
	srai	a1, a1, 44
	add	a1, a1, a2
	mul	a1, a1, s10
	subw	a0, a0, a1
	sw	a0, 0(s1)
	addi	s1, s1, 4
	bnez	s0, .LBB2_8
.LBB2_9:                                #   in Loop: Header=BB2_2 Depth=1
	li	a0, 10
	mul	s4, s6, a0
	andi	a0, s7, -8
	neg	s3, a0
	addi	s0, s4, 9
	addi	s4, s4, 8
	call	clock@plt
	mv	s10, a0
	andi	a6, s0, 7
	li	a7, 3
	li	t0, 5
	j	.LBB2_11
	.p2align	4
.LBB2_10:                               #   in Loop: Header=BB2_11 Depth=2
	beqz	a3, .LBB2_1
.LBB2_11:                               #   Parent Loop BB2_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_18 Depth 3
	lw	a1, 0(s5)
	li	a3, 0
	bgeu	s4, s8, .LBB2_15
# %bb.12:                               #   in Loop: Header=BB2_11 Depth=2
	li	a0, 1
.LBB2_13:                               #   in Loop: Header=BB2_11 Depth=2
	slli	a4, a0, 2
	add	a4, a4, s5
	lw	a5, 0(a4)
	bge	a5, a1, .LBB2_34
# %bb.14:                               #   in Loop: Header=BB2_11 Depth=2
	li	a3, 1
	sw	a5, -4(a4)
	sw	a1, 0(a4)
	beq	a6, s11, .LBB2_10
	j	.LBB2_35
	.p2align	4
.LBB2_15:                               #   in Loop: Header=BB2_11 Depth=2
	addi	a4, s5, 16
	li	a0, 1
	j	.LBB2_18
	.p2align	4
.LBB2_16:                               #   in Loop: Header=BB2_18 Depth=3
	li	a3, 1
	sw	a5, 12(a4)
	sw	a1, 16(a4)
.LBB2_17:                               #   in Loop: Header=BB2_18 Depth=3
	addi	a0, a0, 8
	addi	a4, a4, 32
	add	a2, s3, a0
	beq	a2, s11, .LBB2_13
.LBB2_18:                               #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_11 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	lw	a5, -12(a4)
	bge	a5, a1, .LBB2_26
# %bb.19:                               #   in Loop: Header=BB2_18 Depth=3
	li	a3, 1
	sw	a5, -16(a4)
	sw	a1, -12(a4)
	lw	a5, -8(a4)
	blt	a5, a1, .LBB2_27
.LBB2_20:                               #   in Loop: Header=BB2_18 Depth=3
	mv	a1, a5
	lw	a5, -4(a4)
	blt	a5, a1, .LBB2_28
.LBB2_21:                               #   in Loop: Header=BB2_18 Depth=3
	mv	a1, a5
	lw	a5, 0(a4)
	blt	a5, a1, .LBB2_29
.LBB2_22:                               #   in Loop: Header=BB2_18 Depth=3
	mv	a1, a5
	lw	a5, 4(a4)
	blt	a5, a1, .LBB2_30
.LBB2_23:                               #   in Loop: Header=BB2_18 Depth=3
	mv	a1, a5
	lw	a5, 8(a4)
	blt	a5, a1, .LBB2_31
.LBB2_24:                               #   in Loop: Header=BB2_18 Depth=3
	mv	a1, a5
	lw	a5, 12(a4)
	blt	a5, a1, .LBB2_32
.LBB2_25:                               #   in Loop: Header=BB2_18 Depth=3
	mv	a1, a5
	lw	a5, 16(a4)
	blt	a5, a1, .LBB2_16
	j	.LBB2_33
	.p2align	4
.LBB2_26:                               #   in Loop: Header=BB2_18 Depth=3
	mv	a1, a5
	lw	a5, -8(a4)
	bge	a5, a1, .LBB2_20
.LBB2_27:                               #   in Loop: Header=BB2_18 Depth=3
	li	a3, 1
	sw	a5, -12(a4)
	sw	a1, -8(a4)
	lw	a5, -4(a4)
	bge	a5, a1, .LBB2_21
.LBB2_28:                               #   in Loop: Header=BB2_18 Depth=3
	li	a3, 1
	sw	a5, -8(a4)
	sw	a1, -4(a4)
	lw	a5, 0(a4)
	bge	a5, a1, .LBB2_22
.LBB2_29:                               #   in Loop: Header=BB2_18 Depth=3
	li	a3, 1
	sw	a5, -4(a4)
	sw	a1, 0(a4)
	lw	a5, 4(a4)
	bge	a5, a1, .LBB2_23
.LBB2_30:                               #   in Loop: Header=BB2_18 Depth=3
	li	a3, 1
	sw	a5, 0(a4)
	sw	a1, 4(a4)
	lw	a5, 8(a4)
	bge	a5, a1, .LBB2_24
.LBB2_31:                               #   in Loop: Header=BB2_18 Depth=3
	li	a3, 1
	sw	a5, 4(a4)
	sw	a1, 8(a4)
	lw	a5, 12(a4)
	bge	a5, a1, .LBB2_25
.LBB2_32:                               #   in Loop: Header=BB2_18 Depth=3
	li	a3, 1
	sw	a5, 8(a4)
	sw	a1, 12(a4)
	lw	a5, 16(a4)
	blt	a5, a1, .LBB2_16
.LBB2_33:                               #   in Loop: Header=BB2_18 Depth=3
	mv	a1, a5
	j	.LBB2_17
	.p2align	4
.LBB2_34:                               #   in Loop: Header=BB2_11 Depth=2
	mv	a1, a5
	beq	a6, s11, .LBB2_10
.LBB2_35:                               #   in Loop: Header=BB2_11 Depth=2
	addi	a5, a0, 1
	slli	a5, a5, 2
	add	s0, s5, a5
	lw	a5, 0(s0)
	bge	a5, a1, .LBB2_37
# %bb.36:                               #   in Loop: Header=BB2_11 Depth=2
	li	a3, 1
	sw	a5, 0(a4)
	sw	a1, 0(s0)
	j	.LBB2_38
	.p2align	4
.LBB2_37:                               #   in Loop: Header=BB2_11 Depth=2
	mv	a1, a5
.LBB2_38:                               #   in Loop: Header=BB2_11 Depth=2
	addi	a5, a0, 2
	slli	a5, a5, 2
	add	a5, a5, s5
	lw	s1, 0(a5)
	bge	s1, a1, .LBB2_40
# %bb.39:                               #   in Loop: Header=BB2_11 Depth=2
	li	a3, 1
	sw	s1, 0(s0)
	sw	a1, 0(a5)
	beq	a6, a7, .LBB2_10
	j	.LBB2_41
	.p2align	4
.LBB2_40:                               #   in Loop: Header=BB2_11 Depth=2
	mv	a1, s1
	beq	a6, a7, .LBB2_10
.LBB2_41:                               #   in Loop: Header=BB2_11 Depth=2
	addi	a2, a0, 3
	slli	a2, a2, 2
	add	s0, s5, a2
	lw	s1, 0(s0)
	bge	s1, a1, .LBB2_43
# %bb.42:                               #   in Loop: Header=BB2_11 Depth=2
	li	a3, 1
	sw	s1, 0(a5)
	sw	a1, 0(s0)
	j	.LBB2_44
.LBB2_43:                               #   in Loop: Header=BB2_11 Depth=2
	mv	a1, s1
.LBB2_44:                               #   in Loop: Header=BB2_11 Depth=2
	addi	a2, a0, 4
	slli	a2, a2, 2
	add	a5, s5, a2
	lw	s1, 0(a5)
	bge	s1, a1, .LBB2_46
# %bb.45:                               #   in Loop: Header=BB2_11 Depth=2
	li	a3, 1
	sw	s1, 0(s0)
	sw	a1, 0(a5)
	beq	a6, t0, .LBB2_10
	j	.LBB2_47
.LBB2_46:                               #   in Loop: Header=BB2_11 Depth=2
	mv	a1, s1
	beq	a6, t0, .LBB2_10
.LBB2_47:                               #   in Loop: Header=BB2_11 Depth=2
	addi	a0, a0, 5
	slli	a0, a0, 2
	add	a2, s5, a0
	lw	s1, 0(a2)
	bge	s1, a1, .LBB2_49
# %bb.48:                               #   in Loop: Header=BB2_11 Depth=2
	li	a3, 1
	sw	s1, 0(a5)
	sw	a1, 0(a2)
	lw	a5, 24(a4)
	bge	a5, a1, .LBB2_10
	j	.LBB2_50
.LBB2_49:                               #   in Loop: Header=BB2_11 Depth=2
	mv	a1, s1
	lw	a5, 24(a4)
	bge	a5, s1, .LBB2_10
.LBB2_50:                               #   in Loop: Header=BB2_11 Depth=2
	li	a3, 1
	addi	a4, a4, 24
	sw	a5, 0(a2)
	sw	a1, 0(a4)
	j	.LBB2_10
.LBB2_51:
	ld	a0, 24(sp)                      # 8-byte Folded Reload
	call	fclose@plt
	ld	ra, 248(sp)                     # 8-byte Folded Reload
	li	a0, 0
	ld	s0, 240(sp)                     # 8-byte Folded Reload
	ld	s1, 232(sp)                     # 8-byte Folded Reload
	ld	s2, 224(sp)                     # 8-byte Folded Reload
	ld	s3, 216(sp)                     # 8-byte Folded Reload
	ld	s4, 208(sp)                     # 8-byte Folded Reload
	ld	s5, 200(sp)                     # 8-byte Folded Reload
	ld	s6, 192(sp)                     # 8-byte Folded Reload
	ld	s7, 184(sp)                     # 8-byte Folded Reload
	ld	s8, 176(sp)                     # 8-byte Folded Reload
	ld	s9, 168(sp)                     # 8-byte Folded Reload
	ld	s10, 160(sp)                    # 8-byte Folded Reload
	ld	s11, 152(sp)                    # 8-byte Folded Reload
	fld	fs0, 144(sp)                    # 8-byte Folded Reload
	addi	sp, sp, 256
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

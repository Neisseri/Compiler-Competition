	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0"
	.file	"a.ll"
	.globl	main                            # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %B16
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	li	a0, 2
	li	a1, 2
	call	deepWhileBr@plt
	call	putint@plt
	li	a0, 2
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	deepWhileBr                     # -- Begin function deepWhileBr
	.p2align	2
	.type	deepWhileBr,@function
deepWhileBr:                            # @deepWhileBr
	.cfi_startproc
# %bb.0:                                # %B2
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)                      # 4-byte Folded Spill
	sw	s0, 24(sp)                      # 4-byte Folded Spill
	sw	s1, 20(sp)                      # 4-byte Folded Spill
	sw	s2, 16(sp)                      # 4-byte Folded Spill
	sw	s3, 12(sp)                      # 4-byte Folded Spill
	sw	s4, 8(sp)                       # 4-byte Folded Spill
	sw	s5, 4(sp)                       # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	.cfi_offset s2, -16
	.cfi_offset s3, -20
	.cfi_offset s4, -24
	.cfi_offset s5, -28
	add	s0, a0, a1
	li	s1, 74
	li	s2, 42
	li	s3, 100
	slli	a0, s2, 1
	li	s4, 1
	slli	s5, a0, 1
.LBB1_1:                                # %B3
                                        # =>This Inner Loop Header: Depth=1
	blt	s1, s0, .LBB1_6
# %bb.2:                                # %B4
                                        #   in Loop: Header=BB1_1 Depth=1
	bge	s0, s3, .LBB1_1
# %bb.3:                                # %B7
                                        #   in Loop: Header=BB1_1 Depth=1
	add	s0, s0, s2
	blt	s0, s3, .LBB1_1
# %bb.4:                                # %B10
                                        #   in Loop: Header=BB1_1 Depth=1
	li	a0, 0
	call	get_one@plt
	bne	a0, s4, .LBB1_1
# %bb.5:                                # %B13
                                        #   in Loop: Header=BB1_1 Depth=1
	mv	s0, s5
	j	.LBB1_1
.LBB1_6:                                # %B5
	mv	a0, s0
	lw	ra, 28(sp)                      # 4-byte Folded Reload
	lw	s0, 24(sp)                      # 4-byte Folded Reload
	lw	s1, 20(sp)                      # 4-byte Folded Reload
	lw	s2, 16(sp)                      # 4-byte Folded Reload
	lw	s3, 12(sp)                      # 4-byte Folded Reload
	lw	s4, 8(sp)                       # 4-byte Folded Reload
	lw	s5, 4(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end1:
	.size	deepWhileBr, .Lfunc_end1-deepWhileBr
	.cfi_endproc
                                        # -- End function
	.globl	get_one                         # -- Begin function get_one
	.p2align	2
	.type	get_one,@function
get_one:                                # @get_one
	.cfi_startproc
# %bb.0:                                # %B0
	li	a0, 1
	ret
.Lfunc_end2:
	.size	get_one, .Lfunc_end2-get_one
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits

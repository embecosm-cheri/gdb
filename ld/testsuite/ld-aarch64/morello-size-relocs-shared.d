# Checking that:
#    1) Size relocation is handled.
#    2) Size relocation inserts correct size.
#source: morello-size-relocs.s
#as: -march=morello+c64
#ld: -shared
#objdump: -t -d

.*:     file format .*

SYMBOL TABLE:
#...
.* l       .data	000000000000a0a0 sym1
.*
.* l       .data	a0a0b0b0c0c0d0d0 sym4
.* l       .data	0000a0a0b0b0c0c0 sym3
.* l       .data	00000000a0a0b0b0 sym2
#...


Disassembly of section \.text:

.* <_start>:
 +[0-9a-f]+:	.*	movk	x12, #0xa0a0
 +[0-9a-f]+:	.*	movk	x12, #0xa0a0
 +[0-9a-f]+:	.*	movk	x12, #0x0, lsl #16
 +[0-9a-f]+:	.*	movk	x12, #0x0, lsl #16
 +[0-9a-f]+:	.*	movk	x12, #0x0, lsl #32
 +[0-9a-f]+:	.*	movk	x12, #0x0, lsl #32
 +[0-9a-f]+:	.*	movk	x12, #0x0, lsl #48
 +[0-9a-f]+:	.*	movk	x13, #0xb0b0
 +[0-9a-f]+:	.*	movk	x13, #0xa0a0, lsl #16
 +[0-9a-f]+:	.*	movk	x13, #0xa0a0, lsl #16
 +[0-9a-f]+:	.*	movk	x13, #0x0, lsl #32
 +[0-9a-f]+:	.*	movk	x13, #0x0, lsl #32
 +[0-9a-f]+:	.*	movk	x13, #0x0, lsl #48
 +[0-9a-f]+:	.*	movk	x13, #0xc0c0
 +[0-9a-f]+:	.*	movk	x13, #0xb0b0, lsl #16
 +[0-9a-f]+:	.*	movk	x13, #0xa0a0, lsl #32
 +[0-9a-f]+:	.*	movk	x13, #0xa0a0, lsl #32
 +[0-9a-f]+:	.*	movk	x13, #0x0, lsl #48
 +[0-9a-f]+:	.*	movk	x13, #0xd0d0
 +[0-9a-f]+:	.*	movk	x13, #0xc0c0, lsl #16
 +[0-9a-f]+:	.*	movk	x13, #0xb0b0, lsl #32
 +[0-9a-f]+:	.*	movk	x13, #0xa0a0, lsl #48
 +[0-9a-f]+:	.*	mov	x12, #0xa0a0                	// #41120
 +[0-9a-f]+:	.*	mov	x12, #0xa0a0                	// #41120
 +[0-9a-f]+:	.*	movz	x12, #0x0, lsl #16
 +[0-9a-f]+:	.*	movz	x12, #0x0, lsl #16
 +[0-9a-f]+:	.*	movz	x12, #0x0, lsl #32
 +[0-9a-f]+:	.*	movz	x12, #0x0, lsl #32
 +[0-9a-f]+:	.*	movz	x12, #0x0, lsl #48
 +[0-9a-f]+:	.*	mov	x13, #0xb0b0                	// #45232
 +[0-9a-f]+:	.*	mov	x13, #0xa0a00000            	// #2694840320
 +[0-9a-f]+:	.*	mov	x13, #0xa0a00000            	// #2694840320
 +[0-9a-f]+:	.*	movz	x13, #0x0, lsl #32
 +[0-9a-f]+:	.*	movz	x13, #0x0, lsl #32
 +[0-9a-f]+:	.*	movz	x13, #0x0, lsl #48
 +[0-9a-f]+:	.*	mov	x13, #0xc0c0                	// #49344
 +[0-9a-f]+:	.*	mov	x13, #0xb0b00000            	// #2964324352
 +[0-9a-f]+:	.*	mov	x13, #0xa0a000000000        	// #176609055211520
 +[0-9a-f]+:	.*	mov	x13, #0xa0a000000000        	// #176609055211520
 +[0-9a-f]+:	.*	movz	x13, #0x0, lsl #48
 +[0-9a-f]+:	.*	mov	x13, #0xd0d0                	// #53456
 +[0-9a-f]+:	.*	mov	x13, #0xc0c00000            	// #3233808384
 +[0-9a-f]+:	.*	mov	x13, #0xb0b000000000        	// #194269960732672
 +[0-9a-f]+:	.*	mov	x13, #0xa0a0000000000000    	// #-6872493031367376896

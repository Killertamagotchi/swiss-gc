/* 
 * Copyright (c) 2020-2024, Extrems <extrems@extremscorner.org>
 * 
 * This file is part of Swiss.
 * 
 * Swiss is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * Swiss is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * with Swiss.  If not, see <https://www.gnu.org/licenses/>.
 */

#define _LANGUAGE_ASSEMBLY
#include "asm.h"

.section .init
	.globl _start
_start:
#ifdef APPLOADER
	lis		r3, 0x8000
	lis		r0, 0xfee1
	ori		r0, r0, 0xdead
	stw		r0, 0x00E8 (r3)

	li		r3, 0
	mtsrr1	r3
	lis		r3, startup@ha
	addi	r3, r3, startup@l
	mtsrr0	r3
	rfi
#else
	mfmsr	r3
	b		1f
	.asciz	"STUBHAXX"
	.align 2

1:	li		r3, 0
	mtsrr1	r3
	li		r3, startup
	mtsrr0	r3
	rfi
#endif

startup:
	lis		r0, 0x8000
	ori		r0, r0, 0x000C
	mtear	r0

	li		r3, 0
	lis		r0, reset@h + 0x48000002
	ori		r0, r0, reset@l + 0x48000002
1:	stwu	r0, 0x0100 (r3)
	dcbst	r0, r3
	sync
	icbi	r0, r3
	cmplwi	r3, 0x1700
	blt		1b

	li		r0, 0
#ifdef APPLOADER
	lis		sp, 0x0180
#else
	li		sp, 0x3000
#endif
	stwu	r0, -8 (sp)

	bl		pf_main

	lis		r3, 0x0C00
	li		r4, 0x3000 + 9*4
	eciwx	r0, r4, r3
	andi.	r0, r0, 0b100
	beq		reset

	bl		dvd_main

reset:
	lis		r3, 0x0C00
#ifndef APPLOADER
	li		r4, 0x6800
	li		r0, ((1 << 1) << 7) | (3 << 4)
	ecowx	r0, r4, r3
	li		r5, 0x6800 + 4*4
	lis		r0, 0xC000
	ecowx	r0, r5, r3
	li		r6, 0x6800 + 3*4
	li		r0, ((4 - 1) << 4) | 0b01
	ecowx	r0, r6, r3
1:	eciwx	r0, r6, r3
	andi.	r0, r0, 0b01
	bne		1b
	lis		r0, 0x0100
	ecowx	r0, r5, r3
	li		r0, ((4 - 1) << 4) | 0b01
	ecowx	r0, r6, r3
2:	eciwx	r0, r6, r3
	andi.	r0, r0, 0b01
	bne		2b
	ecowx	r0, r4, r3
#endif
	li		r4, 0x3000 + 9*4
	li		r0, 0b000
	ecowx	r0, r4, r3
	b		.

	.globl run
run:
#ifdef APPLOADER
	lis		r4, 0x0C00
	li		r5, 0x6800
	li		r0, ((1 << 1) << 7) | (3 << 4)
	ecowx	r0, r5, r4
	li		r6, 0x6800 + 4*4
	lis		r0, 0xC000
	ecowx	r0, r6, r4
	li		r7, 0x6800 + 3*4
	li		r0, ((4 - 1) << 4) | 0b01
	ecowx	r0, r7, r4
1:	eciwx	r0, r7, r4
	andi.	r0, r0, 0b01
	bne		1b
	lis		r0, 0x0600
	ecowx	r0, r6, r4
	li		r0, ((4 - 1) << 4) | 0b01
	ecowx	r0, r7, r4
2:	eciwx	r0, r7, r4
	andi.	r0, r0, 0b01
	bne		2b
	ecowx	r0, r5, r4
#endif

	oris	r3, r3, 0x8000
	mtsrr0	r3
	li		r3, 0x30
	mtsrr1	r3
	rfi

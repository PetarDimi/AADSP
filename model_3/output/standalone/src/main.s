	.extern ___TIMER0_COUNT
	.extern ___TIMER1_COUNT
	.extern ___TIMER1_ENABLE
	.public _coeffs_bpf
	.public _coeffs_hpf_800Hz
	.public _coeffs_lpf_18kHz
	.public _enable
	.public _history_def
	.public _mode
	.public _p_state_def
	.public _preGain
	.extern _cl_get_cycle_count
	.extern _cl_wavread_bits_per_sample
	.extern _cl_wavread_close
	.extern _cl_wavread_frame_rate
	.extern _cl_wavread_getnchannels
	.extern _cl_wavread_number_of_frames
	.extern _cl_wavread_open
	.extern _cl_wavread_recvsample
	.extern _cl_wavwrite_close
	.extern _cl_wavwrite_open
	.extern _cl_wavwrite_sendsample
	.public _main
	.extern _printf
	.extern _processing
	.extern _strcpy
	.extern __div
	.ydata_ovly
_coeffs_bpf
	.dw  (0x10e74c)
	.dw  (0xc6568)
	.dw  (0x610a8)
	.dw  (0xfffd9477)
	.dw  (0xfff2954c)
	.dw  (0xffe4b16c)
	.dw  (0xffd38205)
	.dw  (0xffbe9cb1)
	.dw  (0xffa59567)
	.dw  (0xff88011c)
	.dw  (0xff6578cf)
	.dw  (0xff3d9c80)
	.dw  (0xff101884)
	.dw  (0xfedcacd2)
	.dw  (0xfea32b41)
	.dw  (0xfe637bd8)
	.dw  (0xfe1dcb91)
	.dw  (0xfdd26fa5)
	.dw  (0xfd8155a0)
	.dw  (0xfd2b7975)
	.dw  (0xfcd4347d)
	.dw  (0xfc788e11)
	.dw  (0xfc135432)
	.dw  (0xfbc50284)
	.dw  (0xfb8e53a8)
	.dw  (0xfad2983b)
	.dw  (0xfa679f4d)
	.dw  (0xfcc5e577)
	.dw  (0xf9dbe382)
	.dw  (0xeccd8a38)
	.dw  (0x1ec84bf7)
	.dw  (0x58be90e9)
	.dw  (0x1ec84bf7)
	.dw  (0xeccd8a38)
	.dw  (0xf9dbe382)
	.dw  (0xfcc5e577)
	.dw  (0xfa679f4d)
	.dw  (0xfad2983b)
	.dw  (0xfb8e53a8)
	.dw  (0xfbc50284)
	.dw  (0xfc135432)
	.dw  (0xfc788e11)
	.dw  (0xfcd4347d)
	.dw  (0xfd2b7975)
	.dw  (0xfd8155a0)
	.dw  (0xfdd26fa5)
	.dw  (0xfe1dcb91)
	.dw  (0xfe637bd8)
	.dw  (0xfea32b41)
	.dw  (0xfedcacd2)
	.dw  (0xff101884)
	.dw  (0xff3d9c80)
	.dw  (0xff6578cf)
	.dw  (0xff88011c)
	.dw  (0xffa59567)
	.dw  (0xffbe9cb1)
	.dw  (0xffd38205)
	.dw  (0xffe4b16c)
	.dw  (0xfff2954c)
	.dw  (0xfffd9477)
	.dw  (0x610a8)
	.dw  (0xc6568)
	.dw  (0x10e74c)
	.dw  (0x13e383)
	.ydata_ovly
_coeffs_hpf_800Hz
	.dw  (0xff983fc3)
	.dw  (0xff89cfc8)
	.dw  (0xff7a12e7)
	.dw  (0xff68fb3f)
	.dw  (0xff567c43)
	.dw  (0xff428b11)
	.dw  (0xff2d1ed0)
	.dw  (0xff163117)
	.dw  (0xfefdbe57)
	.dw  (0xfee3c659)
	.dw  (0xfec84cbb)
	.dw  (0xfeab5977)
	.dw  (0xfe8cf978)
	.dw  (0xfe6d3f31)
	.dw  (0xfe4c433e)
	.dw  (0xfe2a250c)
	.dw  (0xfe070b88)
	.dw  (0xfde325d1)
	.dw  (0xfdbeabf0)
	.dw  (0xfd99df90)
	.dw  (0xfd750cb9)
	.dw  (0xfd508a8e)
	.dw  (0xfd2cbbfd)
	.dw  (0xfd0a1072)
	.dw  (0xfce90484)
	.dw  (0xfcca228c)
	.dw  (0xfcae033b)
	.dw  (0xfc954e0f)
	.dw  (0xfc80b9c1)
	.dw  (0xfc710c8e)
	.dw  (0xfc671c64)
	.dw  (0x7c5d63de)
	.dw  (0xfc671c64)
	.dw  (0xfc710c8e)
	.dw  (0xfc80b9c1)
	.dw  (0xfc954e0f)
	.dw  (0xfcae033b)
	.dw  (0xfcca228c)
	.dw  (0xfce90484)
	.dw  (0xfd0a1072)
	.dw  (0xfd2cbbfd)
	.dw  (0xfd508a8e)
	.dw  (0xfd750cb9)
	.dw  (0xfd99df90)
	.dw  (0xfdbeabf0)
	.dw  (0xfde325d1)
	.dw  (0xfe070b88)
	.dw  (0xfe2a250c)
	.dw  (0xfe4c433e)
	.dw  (0xfe6d3f31)
	.dw  (0xfe8cf978)
	.dw  (0xfeab5977)
	.dw  (0xfec84cbb)
	.dw  (0xfee3c659)
	.dw  (0xfefdbe57)
	.dw  (0xff163117)
	.dw  (0xff2d1ed0)
	.dw  (0xff428b11)
	.dw  (0xff567c43)
	.dw  (0xff68fb3f)
	.dw  (0xff7a12e7)
	.dw  (0xff89cfc8)
	.dw  (0xff983fc3)
	.dw  (0xffa571c4)
	.ydata_ovly
_coeffs_lpf_18kHz
	.dw  (0xfffffffe)
	.dw  (0xa)
	.dw  (0xffffffe9)
	.dw  (0x24)
	.dw  (0xffffffe0)
	.dw  (0xffffffeb)
	.dw  (0xa2)
	.dw  (0xfffffe6c)
	.dw  (0x296)
	.dw  (0xfffffd78)
	.dw  (0xffffff2c)
	.dw  (0xa71)
	.dw  (0xffffe42e)
	.dw  (0x2ff8)
	.dw  (0xffffcc9d)
	.dw  (0xfffffcbe)
	.dw  (0xaf11)
	.dw  (0xfffe06f0)
	.dw  (0x39acd)
	.dw  (0xfffbc42b)
	.dw  (0xbb67)
	.dw  (0xbde65)
	.dw  (0xffd9d05a)
	.dw  (0x4b8a01)
	.dw  (0xff9c514b)
	.dw  (0x2b3f22)
	.dw  (0xe16098)
	.dw  (0xfc7bcc86)
	.dw  (0x87a5774)
	.dw  (0xf041b056)
	.dw  (0x1727a1dc)
	.dw  (0x658f5326)
	.dw  (0x1727a1dc)
	.dw  (0xf041b056)
	.dw  (0x87a5774)
	.dw  (0xfc7bcc86)
	.dw  (0xe16098)
	.dw  (0x2b3f22)
	.dw  (0xff9c514b)
	.dw  (0x4b8a01)
	.dw  (0xffd9d05a)
	.dw  (0xbde65)
	.dw  (0xbb67)
	.dw  (0xfffbc42b)
	.dw  (0x39acd)
	.dw  (0xfffe06f0)
	.dw  (0xaf11)
	.dw  (0xfffffcbe)
	.dw  (0xffffcc9d)
	.dw  (0x2ff8)
	.dw  (0xffffe42e)
	.dw  (0xa71)
	.dw  (0xffffff2c)
	.dw  (0xfffffd78)
	.dw  (0x296)
	.dw  (0xfffffe6c)
	.dw  (0xa2)
	.dw  (0xffffffeb)
	.dw  (0xffffffe0)
	.dw  (0x24)
	.dw  (0xffffffe9)
	.dw  (0xa)
	.dw  (0xfffffffe)
	.dw  (0xfffffffe)
	.xdata_ovly
_enable
	.bss (0x1)
	.xdata_ovly
_history_def
	.bss (0x180)
	.xdata_ovly
_mode
	.bss (0x1)
	.xdata_ovly
_p_state_def
	.bss (0x6)
	.xdata_ovly
_preGain
	.bss (0x1)
	.ydata_ovly
_sampleBuffer
	.bss (0x80)
	.xdata_ovly
_string_const_0
	.dw  (0x45)
	.dw  (0x72)
	.dw  (0x72)
	.dw  (0x6f)
	.dw  (0x72)
	.dw  (0x3a)
	.dw  (0x20)
	.dw  (0x43)
	.dw  (0x6f)
	.dw  (0x75)
	.dw  (0x6c)
	.dw  (0x64)
	.dw  (0x20)
	.dw  (0x6e)
	.dw  (0x6f)
	.dw  (0x74)
	.dw  (0x20)
	.dw  (0x6f)
	.dw  (0x70)
	.dw  (0x65)
	.dw  (0x6e)
	.dw  (0x20)
	.dw  (0x77)
	.dw  (0x61)
	.dw  (0x76)
	.dw  (0x65)
	.dw  (0x66)
	.dw  (0x69)
	.dw  (0x6c)
	.dw  (0x65)
	.dw  (0x2e)
	.dw  (0xa)
	.dw  (0x0)
	.xdata_ovly
_string_const_1
	.dw  (0x45)
	.dw  (0x72)
	.dw  (0x72)
	.dw  (0x6f)
	.dw  (0x72)
	.dw  (0x20)
	.dw  (0x3a)
	.dw  (0x20)
	.dw  (0x43)
	.dw  (0x6f)
	.dw  (0x75)
	.dw  (0x6c)
	.dw  (0x64)
	.dw  (0x20)
	.dw  (0x6e)
	.dw  (0x6f)
	.dw  (0x74)
	.dw  (0x20)
	.dw  (0x6f)
	.dw  (0x70)
	.dw  (0x65)
	.dw  (0x6e)
	.dw  (0x20)
	.dw  (0x77)
	.dw  (0x61)
	.dw  (0x76)
	.dw  (0x65)
	.dw  (0x66)
	.dw  (0x69)
	.dw  (0x6c)
	.dw  (0x65)
	.dw  (0x2e)
	.dw  (0xa)
	.dw  (0x0)
	.xdata_ovly
_string_const_2
	.dw  (0x25)
	.dw  (0x6c)
	.dw  (0x6c)
	.dw  (0x75)
	.dw  (0xa)
	.dw  (0x0)
	.code_ovly



	# This construction should ensure linking of crt0 in case when target is a standalone program without the OS
	.if defined(_OVLY_)
		.if .strcmp('standalone',_OVLY_)=0
		.if .strcmp('crystal32',_TARGET_FAMILY_)=0
			.extern __start         # dummy use of __start to force linkage of crt0
dummy		.equ(__start)
		.else
			.extern __intvec         # dummy use of __intvec to force linkage of intvec
dummy		.equ(__intvec)
		.endif
		.endif
	.endif

_main:			/* LN: 245 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 245 | 
	i7 += 1			# LN: 245 | 
	i7 = i7 + (0x218)			# LN: 245 | 
	i1 = i7 - (0x1)			# LN: 245 | 
	xmem[i1] = a0h			# LN: 245 | 
	i1 = i7 - (0x2)			# LN: 245 | 
	xmem[i1] = i0			# LN: 245 | 
cline_245_0:			/* LN: 266 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 266 | 
	uhalfword(a0) = (0x1)			# LN: 266 | 
	xmem[i0] = a0h			# LN: 266 | 
cline_266_0:			/* LN: 267 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 267 | 
	xmem[_mode + 0] = a0h			# LN: 267 | 
cline_267_0:			/* LN: 268 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 268 | 
	a0 = (0x8000)			# LN: 268 | 
	xmem[i0] = a0h			# LN: 268 | 
cline_268_0:			/* LN: 271 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 271 | 
	a0 = 0			# LN: 271 | 
	xmem[i0] = a0h			# LN: 271 | 
	do (0x8), label_end_93			# LN: 271 | 
cline_271_0:			/* LN: 272 | CYCLE: 0 | RULES: () */ 
label_begin_93:			/* LN: 271 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 272 | 
	a0 = 0			# LN: 272 | 
	xmem[i0] = a0h			# LN: 272 | 
	do (0x10), label_end_92			# LN: 272 | 
cline_272_0:			/* LN: 273 | CYCLE: 0 | RULES: () */ 
label_begin_92:			/* LN: 272 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 273 | 
	a0 = xmem[i0]; a1 = 0			# LN: 273, 273 | 
	a0 = a0 << 4			# LN: 273 | 
	i0 = a0			# LN: 273 | 
	i1 = i7 - (0x6)			# LN: 273 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 273 | 
	a0 = xmem[i1]			# LN: 273 | 
	b0 = i0			# LN: 273 | 
	a0 = a0 + b0			# LN: 273 | 
	AnyReg(i0, a0h)			# LN: 273 | 
	nop #empty cycle
	ymem[i0] = a1h			# LN: 273 | 
cline_273_0:			/* LN: 272 | CYCLE: 0 | RULES: () */ 
init_latch_label_0:			/* LN: 273 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 272 | 
	a0 = xmem[i0]			# LN: 272 | 
	uhalfword(a1) = (0x1)			# LN: 272 | 
	a0 = a0 + a1			# LN: 272 | 
	i0 = i7 - (0x6)			# LN: 272 | 
label_end_92:			# LN: 272 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 272 | 
cline_272_1:			/* LN: 271 | CYCLE: 0 | RULES: () */ 
init_latch_label_1:			/* LN: 274 | CYCLE: 0 | RULES: () */ 
for_end_1:			/* LN: 272 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 271 | 
	a0 = xmem[i0]			# LN: 271 | 
	uhalfword(a1) = (0x1)			# LN: 271 | 
	a0 = a0 + a1			# LN: 271 | 
	i0 = i7 - (0x5)			# LN: 271 | 
label_end_93:			# LN: 271 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 271 | 
cline_271_1:			/* LN: 276 | CYCLE: 0 | RULES: () */ 
for_end_0:			/* LN: 271 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 276 | 
	i0 = xmem[i0]			# LN: 276 | 
	i1 = i7 - (262 - 0)			# LN: 276 | 
	i4 = xmem[i0]			# LN: 276 | 
	i0 = i1			# LN: 276 | 
	i1 = i4			# LN: 276 | 
	call (_strcpy)			# LN: 276 | 
cline_276_0:			/* LN: 277 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (262 - 0)			# LN: 277 | 
	call (_cl_wavread_open)			# LN: 277 | 
	AnyReg(i0, a0h)			# LN: 277 | 
	i1 = i7 - (0x107)			# LN: 277 | 
	xmem[i1] = i0			# LN: 277 | 
cline_277_0:			/* LN: 278 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x107)			# LN: 278 | 
	a0 = xmem[i0]			# LN: 278 | 
	a0 & a0			# LN: 278 | 
	if (a != 0) jmp (else_0)			# LN: 278 | 
cline_278_0:			/* LN: 279 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_0)			# LN: 279 | 
	call (_printf)			# LN: 279 | 
cline_279_0:			/* LN: 280 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 280 | 
	jmp (__epilogue_256)			# LN: 280 | 
cline_280_0:			/* LN: 285 | CYCLE: 0 | RULES: () */ 
endif_0:			/* LN: 278 | CYCLE: 0 | RULES: () */ 
else_0:			/* LN: 278 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x107)			# LN: 285 | 
	i0 = xmem[i0]			# LN: 285 | 
	call (_cl_wavread_getnchannels)			# LN: 285 | 
	i0 = i7 - (0x108)			# LN: 285 | 
	xmem[i0] = a0h			# LN: 285 | 
cline_285_0:			/* LN: 286 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x107)			# LN: 286 | 
	i0 = xmem[i0]			# LN: 286 | 
	call (_cl_wavread_bits_per_sample)			# LN: 286 | 
	i0 = i7 - (0x109)			# LN: 286 | 
	xmem[i0] = a0h			# LN: 286 | 
cline_286_0:			/* LN: 287 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x107)			# LN: 287 | 
	i0 = xmem[i0]			# LN: 287 | 
	call (_cl_wavread_frame_rate)			# LN: 287 | 
	i0 = i7 - (0x10a)			# LN: 287 | 
	xmem[i0] = a0h			# LN: 287 | 
cline_287_0:			/* LN: 288 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x107)			# LN: 288 | 
	i0 = xmem[i0]			# LN: 288 | 
	call (_cl_wavread_number_of_frames)			# LN: 288 | 
	i0 = i7 - (0x10b)			# LN: 288 | 
	xmem[i0] = a0h			# LN: 288 | 
cline_288_0:			/* LN: 293 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 293 | 
	i0 = xmem[i0]			# LN: 293 | 
	i1 = i7 - (523 - 0)			# LN: 293 | 
	i0 += 1			# LN: 293 | 
	i4 = xmem[i0]			# LN: 293 | 
	i0 = i1			# LN: 293 | 
	i1 = i4			# LN: 293 | 
	call (_strcpy)			# LN: 293 | 
cline_293_0:			/* LN: 294 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 294 | 
	a0 = xmem[i0]			# LN: 294 | 
	a0 & a0			# LN: 294 | 
	if (a == 0) jmp (elsecondition_0)			# LN: 294 | 
	uhalfword(a0) = (0x6)			# LN: 294 | 
	jmp (endcondition_0)			# LN: 294 | 
elsecondition_0:			/* LN: 294 | CYCLE: 0 | RULES: () */ 
	uhalfword(a0) = (0x2)			# LN: 294 | 
endcondition_0:			/* LN: 294 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 294 | 
	xmem[i0] = a0h			# LN: 294 | 
cline_294_0:			/* LN: 295 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (523 - 0)			# LN: 295 | 
	i1 = i7 - (0x109)			# LN: 295 | 
	a0 = xmem[i1]			# LN: 295 | 
	i1 = i7 - (0x20c)			# LN: 295 | 
	a1 = xmem[i1]			# LN: 295 | 
	i1 = i7 - (0x10a)			# LN: 295 | 
	b0 = xmem[i1]			# LN: 295 | 
	call (_cl_wavwrite_open)			# LN: 295 | 
	AnyReg(i0, a0h)			# LN: 295 | 
	i1 = i7 - (0x20d)			# LN: 295 | 
	xmem[i1] = i0			# LN: 295 | 
cline_295_0:			/* LN: 296 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 296 | 
	a0 = xmem[i0]			# LN: 296 | 
	a0 & a0			# LN: 296 | 
	if (a != 0) jmp (else_1)			# LN: 296 | 
cline_296_0:			/* LN: 297 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_1)			# LN: 297 | 
	call (_printf)			# LN: 297 | 
cline_297_0:			/* LN: 298 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 298 | 
	jmp (__epilogue_256)			# LN: 298 | 
cline_298_0:			/* LN: 301 | CYCLE: 0 | RULES: () */ 
endif_1:			/* LN: 296 | CYCLE: 0 | RULES: () */ 
else_1:			/* LN: 296 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 301 | 
	a0 = xmem[i0]			# LN: 301 | 
	a0 & a0			# LN: 301 | 
	if (a == 0) jmp (else_2)			# LN: 301 | 
	i0 = i7 - (0x4)			# LN: 301 | 
	a0 = xmem[i0]			# LN: 301 | 
	xmem[_preGain + 0] = a0h			# LN: 301 | 
	jmp (endif_2)			# LN: 301 | 
cline_301_0:			/* LN: 313 | CYCLE: 0 | RULES: () */ 
endif_2:			/* LN: 301 | CYCLE: 0 | RULES: () */ 
else_2:			/* LN: 301 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20e)			# LN: 313 | 
	a0 = 0			# LN: 313 | 
	xmem[i0] = a0h			# LN: 313 | 
for_2:			/* LN: 313 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x10b)			# LN: 313 | 
	a0 = xmem[i0]			# LN: 313 | 
	uhalfword(a1) = (0x10)			# LN: 313 | 
	call (__div)			# LN: 313 | 
	i0 = i7 - (0x20e)			# LN: 313 | 
	a1 = xmem[i0]			# LN: 313 | 
	a1 - a0			# LN: 313 | 
	if (a >= 0) jmp (for_end_2)			# LN: 313 | 
cline_313_0:			/* LN: 315 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20f)			# LN: 315 | 
	a0 = 0			# LN: 315 | 
	xmem[i0] = a0h			# LN: 315 | 
	do (0x10), label_end_94			# LN: 315 | 
cline_315_0:			/* LN: 317 | CYCLE: 0 | RULES: () */ 
label_begin_94:			/* LN: 315 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x210)			# LN: 317 | 
	a0 = 0			# LN: 317 | 
	xmem[i0] = a0h			# LN: 317 | 
for_4:			/* LN: 317 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x210)			# LN: 317 | 
	a0 = xmem[i0]			# LN: 317 | 
	i0 = i7 - (0x108)			# LN: 317 | 
	a1 = xmem[i0]			# LN: 317 | 
	a0 - a1			# LN: 317 | 
	if (a >= 0) jmp (for_end_4)			# LN: 317 | 
cline_317_0:			/* LN: 319 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x107)			# LN: 319 | 
	i0 = xmem[i0]			# LN: 319 | 
	call (_cl_wavread_recvsample)			# LN: 319 | 
	i0 = i7 - (0x211)			# LN: 319 | 
	xmem[i0] = a0h			# LN: 319 | 
cline_319_0:			/* LN: 320 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x210)			# LN: 320 | 
	a0 = xmem[i0]			# LN: 320 | 
	a0 = a0 << 4			# LN: 320 | 
	i0 = a0			# LN: 320 | 
	i1 = i7 - (0x20f)			# LN: 320 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 320 | 
	a0 = xmem[i1]			# LN: 320 | 
	a1 = i0			# LN: 320 | 
	a0 = a1 + a0			# LN: 320 | 
	AnyReg(i0, a0h)			# LN: 320 | 
	i1 = i7 - (0x211)			# LN: 320 | 
	a0 = xmem[i1]			# LN: 320 | 
	ymem[i0] = a0h			# LN: 320 | 
cline_320_0:			/* LN: 317 | CYCLE: 0 | RULES: () */ 
init_latch_label_2:			/* LN: 321 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x210)			# LN: 317 | 
	a0 = xmem[i0]			# LN: 317 | 
	uhalfword(a1) = (0x1)			# LN: 317 | 
	a0 = a0 + a1			# LN: 317 | 
	i0 = i7 - (0x210)			# LN: 317 | 
	xmem[i0] = a0h			# LN: 317 | 
	jmp (for_4)			# LN: 317 | 
cline_317_1:			/* LN: 315 | CYCLE: 0 | RULES: () */ 
init_latch_label_3:			/* LN: 322 | CYCLE: 0 | RULES: () */ 
for_end_4:			/* LN: 317 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20f)			# LN: 315 | 
	a0 = xmem[i0]			# LN: 315 | 
	uhalfword(a1) = (0x1)			# LN: 315 | 
	a0 = a0 + a1			# LN: 315 | 
	i0 = i7 - (0x20f)			# LN: 315 | 
label_end_94:			# LN: 315 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 315 | 
cline_315_1:			/* LN: 323 | CYCLE: 0 | RULES: () */ 
for_end_3:			/* LN: 315 | CYCLE: 0 | RULES: () */ 
	call (_cl_get_cycle_count)			# LN: 323 | 
	i0 = i7 - (0x213)			# LN: 323 | 
	xmem[i0] = a0h; i0 += 1			# LN: 323, 323 | 
	xmem[i0] = a0l			# LN: 323 | 
cline_323_0:			/* LN: 325 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 325 | 
	a0 = xmem[i0]			# LN: 325 | 
	a0 & a0			# LN: 325 | 
	if (a == 0) jmp (else_3)			# LN: 325 | 
	i0 = (0) + (_sampleBuffer)			# LN: 325 | 
	i1 = (0) + (_sampleBuffer)			# LN: 325 | 
	call (_processing)			# LN: 325 | 
	jmp (endif_3)			# LN: 325 | 
cline_325_0:			/* LN: 327 | CYCLE: 0 | RULES: () */ 
endif_3:			/* LN: 325 | CYCLE: 0 | RULES: () */ 
else_3:			/* LN: 325 | CYCLE: 0 | RULES: () */ 
	call (_cl_get_cycle_count)			# LN: 327 | 
	i0 = i7 - (0x215)			# LN: 327 | 
	xmem[i0] = a0h; i0 += 1			# LN: 327, 327 | 
	xmem[i0] = a0l			# LN: 327 | 
cline_327_0:			/* LN: 328 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x215)			# LN: 328 | 
	a0 = xmem[i0]; i0 += 1			# LN: 328, 328 | 
	a0l = xmem[i0]			# LN: 328 | 
	i0 = i7 - (0x213)			# LN: 328 | 
	a1 = xmem[i0]; i0 += 1			# LN: 328, 328 | 
	a1l = xmem[i0]			# LN: 328 | 
	a0 = a0 - a1			# LN: 328 | 
	i0 = i7 - (0x217)			# LN: 328 | 
	xmem[i0] = a0h; i0 += 1			# LN: 328, 328 | 
	xmem[i0] = a0l			# LN: 328 | 
cline_328_0:			/* LN: 329 | CYCLE: 0 | RULES: () */ 
	i1 = i7 - (0x217)			# LN: 329 | 
	a0 = xmem[i1]; i1 += 1			# LN: 329, 329 | 
	a0l = xmem[i1]			# LN: 329 | 
	i0 = (0) + (_string_const_2)			# LN: 329 | 
	call (_printf)			# LN: 329 | 
cline_329_0:			/* LN: 331 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20f)			# LN: 331 | 
	a0 = 0			# LN: 331 | 
	xmem[i0] = a0h			# LN: 331 | 
	do (0x10), label_end_95			# LN: 331 | 
cline_331_0:			/* LN: 333 | CYCLE: 0 | RULES: () */ 
label_begin_95:			/* LN: 331 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 333 | 
	a0 = xmem[i0]			# LN: 333 | 
	a0 & a0			# LN: 333 | 
	if (a == 0) jmp (elsecondition_1)			# LN: 333 | 
	i0 = i7 - (0x20c)			# LN: 333 | 
	a0 = xmem[i0]			# LN: 333 | 
	uhalfword(a1) = (0x1)			# LN: 333 | 
	a0 = a0 + a1			# LN: 333 | 
	jmp (endcondition_1)			# LN: 333 | 
elsecondition_1:			/* LN: 333 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 333 | 
	a0 = xmem[i0]			# LN: 333 | 
endcondition_1:			/* LN: 333 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x218)			# LN: 333 | 
	xmem[i0] = a0h			# LN: 333 | 
cline_333_0:			/* LN: 334 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 334 | 
	a0 = xmem[i0]			# LN: 334 | 
	a0 & a0			# LN: 334 | 
	if (a == 0) jmp (elsecondition_2)			# LN: 334 | 
	uhalfword(a0) = (0x1)			# LN: 334 | 
	jmp (endcondition_2)			# LN: 334 | 
elsecondition_2:			/* LN: 334 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 334 | 
endcondition_2:			/* LN: 334 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x210)			# LN: 334 | 
	xmem[i0] = a0h			# LN: 334 | 
for_6:			/* LN: 334 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x210)			# LN: 334 | 
	a0 = xmem[i0]			# LN: 334 | 
	i0 = i7 - (0x218)			# LN: 334 | 
	a1 = xmem[i0]			# LN: 334 | 
	a0 - a1			# LN: 334 | 
	if (a >= 0) jmp (for_end_6)			# LN: 334 | 
cline_334_0:			/* LN: 336 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x210)			# LN: 336 | 
	a0 = xmem[i0]			# LN: 336 | 
	a0 = a0 << 4			# LN: 336 | 
	i0 = a0			# LN: 336 | 
	i1 = i7 - (0x20f)			# LN: 336 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 336 | 
	a0 = xmem[i1]			# LN: 336 | 
	a1 = i0			# LN: 336 | 
	a0 = a1 + a0			# LN: 336 | 
	AnyReg(i0, a0h)			# LN: 336 | 
	i1 = i7 - (0x211)			# LN: 336 | 
	a0 = ymem[i0]			# LN: 336 | 
	xmem[i1] = a0h			# LN: 336 | 
cline_336_0:			/* LN: 337 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 337 | 
	i1 = i7 - (0x211)			# LN: 337 | 
	a0 = xmem[i1]			# LN: 337 | 
	i0 = xmem[i0]			# LN: 337 | 
	call (_cl_wavwrite_sendsample)			# LN: 337 | 
cline_337_0:			/* LN: 334 | CYCLE: 0 | RULES: () */ 
init_latch_label_4:			/* LN: 338 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x210)			# LN: 334 | 
	a0 = xmem[i0]			# LN: 334 | 
	uhalfword(a1) = (0x1)			# LN: 334 | 
	a0 = a0 + a1			# LN: 334 | 
	i0 = i7 - (0x210)			# LN: 334 | 
	xmem[i0] = a0h			# LN: 334 | 
	jmp (for_6)			# LN: 334 | 
cline_334_1:			/* LN: 331 | CYCLE: 0 | RULES: () */ 
init_latch_label_5:			/* LN: 339 | CYCLE: 0 | RULES: () */ 
for_end_6:			/* LN: 334 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20f)			# LN: 331 | 
	a0 = xmem[i0]			# LN: 331 | 
	uhalfword(a1) = (0x1)			# LN: 331 | 
	a0 = a0 + a1			# LN: 331 | 
	i0 = i7 - (0x20f)			# LN: 331 | 
label_end_95:			# LN: 331 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 331 | 
cline_331_1:			/* LN: 313 | CYCLE: 0 | RULES: () */ 
init_latch_label_6:			/* LN: 340 | CYCLE: 0 | RULES: () */ 
for_end_5:			/* LN: 331 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20e)			# LN: 313 | 
	a0 = xmem[i0]			# LN: 313 | 
	uhalfword(a1) = (0x1)			# LN: 313 | 
	a0 = a0 + a1			# LN: 313 | 
	i0 = i7 - (0x20e)			# LN: 313 | 
	xmem[i0] = a0h			# LN: 313 | 
	jmp (for_2)			# LN: 313 | 
cline_313_1:			/* LN: 346 | CYCLE: 0 | RULES: () */ 
for_end_2:			/* LN: 313 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x107)			# LN: 346 | 
	i0 = xmem[i0]			# LN: 346 | 
	call (_cl_wavread_close)			# LN: 346 | 
cline_346_0:			/* LN: 347 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 347 | 
	i0 = xmem[i0]			# LN: 347 | 
	call (_cl_wavwrite_close)			# LN: 347 | 
cline_347_0:			/* LN: 350 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 350 | 
	jmp (__epilogue_256)			# LN: 350 | 
cline_350_0:			/* LN: 351 | CYCLE: 0 | RULES: () */ 
__epilogue_256:			/* LN: 351 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x218)			# LN: 351 | 
	i7 -= 1			# LN: 351 | 
	ret			# LN: 351 | 

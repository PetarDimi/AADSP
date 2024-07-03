#ifndef _COMMON_H
#define _COMMON_H

#include <stdfix.h>

#if defined(__CCC)

#include <stdfix.h>

#define FRACT_NUM(x) (x##r)
#define LONG_FRACT_NUM(x) (x##lr)
#define ACCUM_NUM(x) (x##lk)

#define FRACT_NUM_HEX(x) (x##r)

#define FRACT_TO_INT_BIT_CONV(x) (bitsr(x))
#define INT_TO_FRACT_BIT_CONV(x) (rbits(x))

#define long_accum long accum
#define long_fract long fract

#endif

//constat definitions

#define BLOCK_SIZE 16
#define INPUT_NUM_CHANNELS 2
#define OUTPUT_NUM_CHANNELS 6

#define inputChannelLeft 1
#define inputChannelRight 0

#define output_Channel_L 1
#define output_Channel_C 1
#define output_Channel_LS 1
#define output_Channel_RS 1
#define output_Channel_R 1
#define output_Channel_LFE 1

#define MINUS_3DB FRACT_NUM(70794578438413791)
#define n_coeff 64

//DSP type definitions

typedef short DSPshort;					/* DSP integer */
typedef unsigned short DSPushort;		/* DSP unsigned integer */
typedef int DSPint;						/* native integer */
typedef fract DSPfract;					/* DSP fixed-point fractional, data reg, memory word format s.31 */
typedef long_accum DSPaccum;					/* DSP fixed-point fractional, accum reg format s8.63 */

#endif //_COMMON_H

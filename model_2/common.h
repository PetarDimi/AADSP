#ifndef COMMON_H
#define COMMON_H

#include "stdfix_emu.h"

/////////////////////////////////////////////////////////////////////////////////
// Constant definitions
/////////////////////////////////////////////////////////////////////////////////

#define BLOCK_SIZE 16
#define n_coeff 64
#define MINUS_3DB 0.501187

// Number of channels
#define INPUT_NUM_CHANNELS 2
#define OUTPUT_NUM_CHANNELS	6

typedef short DSPshort;
typedef unsigned short DSPushort;
typedef int DSPint;
typedef unsigned int DSPuint;
typedef fract DSPfract;
typedef long_accum DSPaccum;



/////////////////////////////////////////////////////////////////////////////////
#endif
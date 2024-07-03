#ifndef PROCESSING_H
#define PROCESSING_H
#include "common.h"

extern DSPfract preGain;
extern int mode;

__memY extern const DSPfract coeffs_bpf[n_coeff];
__memY extern const DSPfract coeffs_hpf_800Hz[n_coeff];
__memY extern const DSPfract coeffs_lpf_18kHz[n_coeff];

void initPorcessing(const DSPfract preGainValue);
void processing(__memY DSPfract pIn[][BLOCK_SIZE], __memY DSPfract pOut[][BLOCK_SIZE]);
DSPfract fir_circular(DSPfract input, DSPint index, const DSPfract coeffs[]);

#endif

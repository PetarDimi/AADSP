#ifndef PROCESSING_H
#define PROCESSING_H
#include "common.h"

//extern double preGain;

extern const DSPfract coeffs_lpf_18kHz[n_coeff];
extern const DSPfract coeffs_hpf_800Hz[n_coeff];
extern const DSPfract coeffs_bpf[n_coeff];

//extern DSPfract preGain;
extern DSPint mode;

void initProcessing(const double preGainValue);

void processing(DSPfract pIn[][BLOCK_SIZE], DSPfract pOut[][BLOCK_SIZE]);

DSPfract fir_circular(DSPfract input, DSPint index, const DSPfract coeffs[]);

#endif

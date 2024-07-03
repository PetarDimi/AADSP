#ifndef PROCESSING_H
#define PROCESSING_H
#include "common.h"

extern double coeffs_lpf_18kHz[n_coeff];
extern double coeffs_hpf_800Hz[n_coeff];
extern double coeffs_bpf[n_coeff];

extern double preGain;
extern int mode;

double initProcessing(double preGainValue);

void processing(double pIn[][BLOCK_SIZE], double pOut[][BLOCK_SIZE]);

double fir_circular(double input, int index, double coeffs[]);

#endif

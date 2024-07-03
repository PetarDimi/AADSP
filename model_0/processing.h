#ifndef PROCESSING_H
#define PROCESSING_H
#include "common.h"

//extern double preGain;


double initProcessing(double preGainValue);

void processing(double pIn[][BLOCK_SIZE], double pOut[][BLOCK_SIZE], const double LchGain, const double RchGain, const int mode, const int nSamples);

double fir_circular(double input, int index, double coeffs[]);

#endif

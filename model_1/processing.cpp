#include "processing.h"
#include "common.h"
#include <math.h>

#define DB_TO_LINEAR(X) pow(10.0, ((X) / 20.0))

#define inputChannelLeft 0
#define inputChannelRight 1

#define output_Channel_L 0
#define output_Channel_C 1
#define output_Channel_LS 2
#define output_Channel_RS 3
#define output_Channel_R 4
#define output_Channel_LFE 5

double preGain;

static const double limiterThreshold = 0.999;

static double dbConvert(const double value);
static double saturation(const double in);

static double history_def[6][n_coeff];
static unsigned int p_state_def[6];

static int enable = 1;

static double dbConvert(const double value) {
	return pow(10.0, value / 20.0);
}

static double saturation(const double in) {
	if (in > limiterThreshold)
	{
		return limiterThreshold;
	}
	else if (in < -limiterThreshold)
	{
		return -limiterThreshold;
	}

	return in;
}

double initProcessing(double preGainValue) {
	preGain = dbConvert(preGainValue);
	return preGain;
}

double fir_circular(double input, int index, double coeffs[])
{
	int i;
	unsigned int state;
	double ret_val;

	double* history = history_def[index];
	unsigned int* p_state = &p_state_def[index];

	state = *p_state;               /* copy the filter's state to a local */

	/* store input at the beginning of the delay line */
	history[state] = input;
	if (++state >= n_coeff)
	{         /* incr state and check for wrap */
		state = 0;
	}

	/* calc FIR and shift data */
	ret_val = 0;
	for (i = n_coeff - 1; i >= 0; i--)
	{
			ret_val += coeffs[i] * history[state];
		if (++state >= n_coeff) /* incr state and check for wrap */
		{
			state = 0;
		}
	}

	*p_state = state;               /* return new state to caller */

	return ret_val;
}

void processing(double pIn[][BLOCK_SIZE], double pOut[][BLOCK_SIZE]) {

	double* samplePtrIn = *pIn;
	double* samplePtrOut;

	double tempSample[2];
	double* tempSamplePtr = tempSample;

	for (int i = 0; i < BLOCK_SIZE; i++) {

		*tempSamplePtr = *samplePtrIn * preGain;	tempSamplePtr += 1;		samplePtrIn += BLOCK_SIZE;
		*tempSamplePtr = *samplePtrIn * preGain;	tempSamplePtr -= 1;		samplePtrIn -= BLOCK_SIZE;

		samplePtrOut = *pOut + i + ((1 - mode) * BLOCK_SIZE);

		*samplePtrOut = *tempSamplePtr;
		samplePtrOut += BLOCK_SIZE;

		*samplePtrOut = fir_circular(*tempSamplePtr, 0, coeffs_lpf_18kHz);
		samplePtrOut += BLOCK_SIZE;

		*samplePtrOut = fir_circular(*tempSamplePtr, 1, coeffs_hpf_800Hz);
		samplePtrOut += BLOCK_SIZE;

		*samplePtrOut = fir_circular(*tempSamplePtr, 2, coeffs_bpf);
		samplePtrOut += BLOCK_SIZE;
		tempSamplePtr += 1;

		*samplePtrOut = fir_circular(*tempSamplePtr, 3, coeffs_bpf);
		samplePtrOut += BLOCK_SIZE;

		*samplePtrOut = fir_circular(*tempSamplePtr, 4, coeffs_hpf_800Hz);
		samplePtrOut += BLOCK_SIZE;

		*samplePtrOut = fir_circular(*tempSamplePtr, 5, coeffs_lpf_18kHz);
		samplePtrOut += BLOCK_SIZE;
		tempSamplePtr -= 1;

		samplePtrIn++;
	}
}
#include "processing.h"
#include "common.h"
#include <math.h>
#include "stdfix_emu.h"


#define inputChannelLeft 0
#define inputChannelRight 1

#define output_Channel_L 0
#define output_Channel_C 1
#define output_Channel_LS 2
#define output_Channel_RS 3
#define output_Channel_R 4
#define output_Channel_LFE 5

DSPfract preGain;

static const DSPfract limiterThreshold = FRACT_NUM(0.999);

static DSPfract dbConvert(const double value);
static DSPfract saturation(const DSPfract in);

static DSPfract history_def[6][n_coeff];
static DSPuint p_state_def[6];	

static DSPint enable = 1;

static DSPfract dbConvert(const double value) {
	return (DSPfract) pow(10.0, value / 20.0);
}

DSPfract saturation(const DSPfract in) {

	DSPaccum inValue = in;

	if (inValue > (DSPaccum) limiterThreshold)
	{
		return limiterThreshold;
	}
	else if (inValue < (DSPaccum) - limiterThreshold)
	{
		return -limiterThreshold;
	}

	return in;
}

void initProcessing(const double preGainValue) {
	 preGain = dbConvert(preGainValue);
}

DSPfract fir_circular(DSPfract input, DSPint index, const DSPfract coeffs[])
{
	DSPint i;
	DSPuint state;
	DSPaccum ret_val = FRACT_NUM(0.0);
	DSPfract scale;

	DSPfract* history = history_def[index];
	DSPuint* p_state = &p_state_def[index];

	state = *p_state;               /* copy the filter's state to a local */

	/* store input at the beginning of the delay line */
	history[state] = input;
	if (++state >= n_coeff)
	{         /* incr state and check for wrap */
		state = 0;
	}

	/* calc FIR and shift data */
	//ret_val = FRACT_NUM(0);
	for (i = n_coeff - 1; i >= 0; i--)
	{
			ret_val = ret_val + (coeffs[i] * history[state]);
		if (++state >= n_coeff) /* incr state and check for wrap */
		{
			state = 0;
		}
	}


	*p_state = state;               /* return new state to caller */

	return ret_val;
}

void processing(DSPfract pIn[][BLOCK_SIZE], DSPfract pOut[][BLOCK_SIZE]) {

//definisanje pokazivaca
	DSPfract* samplePtrIn = *pIn;
	DSPfract* samplePtrOut;

	DSPfract tempSample[2];
	DSPfract* tempSamplePtr = tempSample;

	for (DSPint i = 0; i < BLOCK_SIZE; i++) {
		
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
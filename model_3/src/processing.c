#include "processing.h"



#ifdef IIR_ASM
void initProcessing(const DSPfract preGainValue)
{
	preGain = preGainValue;
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

void processing(__memY DSPfract pIn[][BLOCK_SIZE], __memY DSPfract pOut[][BLOCK_SIZE])
{
	DSPint j;
	__memY DSPfract* samplePtrIn = *pIn;
	__memY DSPfract* samplePtrOut;

	DSPfract tempSample[2];
	DSPfract* tempSamplePtr = tempSample;

	for(j = 0; j < BLOCK_SIZE; j++)
	{

		*tempSamplePtr = *samplePtrIn * preGain;	tempSamplePtr += 1;		samplePtrIn += BLOCK_SIZE;
		*tempSamplePtr = *samplePtrIn * preGain;	tempSamplePtr -= 1;		samplePtrIn -= BLOCK_SIZE;

		samplePtrOut = *pOut + j + ((1 - mode) * BLOCK_SIZE);


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

#endif

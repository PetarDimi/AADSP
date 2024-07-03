
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "common.h"
#include "processing.h"
#include "WAVheader.h"

static double sampleBuffer[OUTPUT_NUM_CHANNELS + 2][BLOCK_SIZE];

// Processing related variables
static double preGain;

/////////////////////////////////////////////////////////////////////////////////
// @Author	Petar Dimitrijevic RA207-2018
// @Date		15.11.2023.
//
// Function:
// main
//
// @param   - argv[1] - Input file name
//			- argv[2] - Output file name
//			- argv[3] - Enable
//			- argv[4] - Mode
//			- argv[5] - Gain
// @return - nothing
// Comment: main routine of a program
//
// E-mail:	<email>
//
/////////////////////////////////////////////////////////////////////////////////
int main(int argc, char* argv[])
{
	FILE* wav_in = NULL;
	FILE* wav_out = NULL;
	char WavInputName[256];
	char WavOutputName[256];
	WAV_HEADER inputWAVhdr, outputWAVhdr;

	bool enable = true;
	int mode = 0;
	double varGainDB = -3;

	// Init channel buffers
	for (int i = 0; i < OUTPUT_NUM_CHANNELS; i++)
		for (int j = 0; j < BLOCK_SIZE; j++)
			sampleBuffer[i][j] = 0.0;
	//-------------------------------------------------

	switch (argc)
	{
	case 6:
		varGainDB = atof(argv[5]);
		if (varGainDB > 0) {
			printf("Gain range is from 0 to - infinity");
			return 1;
		}
	case 5:
		mode = atoi(argv[4]);
	case 4:
		enable = strcmp(argv[3], "1") ? false : true;
	case 3:
		strcpy(WavInputName, argv[1]);
		wav_in = OpenWavFileForRead(WavInputName, "rb");
		strcpy(WavOutputName, argv[2]);
		wav_out = OpenWavFileForRead(WavOutputName, "wb");
		break;
	default:
		printf("\nInvalid number of arguments");
		return 1;
	}

	// Read input wav header
	//-------------------------------------------------
	ReadWavHeader(wav_in, inputWAVhdr);
	//-------------------------------------------------

	// Set up output WAV header
	//-------------------------------------------------	
	outputWAVhdr = inputWAVhdr;
	outputWAVhdr.fmt.NumChannels = enable ? OUTPUT_NUM_CHANNELS : INPUT_NUM_CHANNELS; //number of channels

	int oneChannelSubChunk2Size = inputWAVhdr.data.SubChunk2Size / inputWAVhdr.fmt.NumChannels;
	int oneChannelByteRate = inputWAVhdr.fmt.ByteRate / inputWAVhdr.fmt.NumChannels;
	int oneChannelBlockAlign = inputWAVhdr.fmt.BlockAlign / inputWAVhdr.fmt.NumChannels;

	outputWAVhdr.data.SubChunk2Size = oneChannelSubChunk2Size * outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.ByteRate = oneChannelByteRate * outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.BlockAlign = oneChannelBlockAlign * outputWAVhdr.fmt.NumChannels;


	// Write output WAV header to file
	//-------------------------------------------------
	WriteWavHeader(wav_out, outputWAVhdr);

	if (enable) preGain = initProcessing(varGainDB);

	// Processing loop
	//-------------------------------------------------	
	{
			int sample;
			int BytesPerSample = inputWAVhdr.fmt.BitsPerSample / 8;
			const double SAMPLE_SCALE = -(double)(1 << 31);		//2^31
			int iNumSamples = inputWAVhdr.data.SubChunk2Size / (inputWAVhdr.fmt.NumChannels * inputWAVhdr.fmt.BitsPerSample / 8);

			// exact file length should be handled correctly...
			for (int i = 0; i < iNumSamples / BLOCK_SIZE; i++)
			{
				for (int j = 0; j < BLOCK_SIZE; j++)
				{
					for (int k = 0; k < inputWAVhdr.fmt.NumChannels; k++)
					{
						sample = 0; //debug
						fread(&sample, BytesPerSample, 1, wav_in);
						sample = sample << (32 - inputWAVhdr.fmt.BitsPerSample); // force signextend
						sampleBuffer[k][j] = sample / SAMPLE_SCALE;				// scale sample to 1.0/-1.0 range		
					}
				}

				if (enable) processing(sampleBuffer, sampleBuffer, preGain, preGain, mode, BLOCK_SIZE);

				for (int j = 0; j < BLOCK_SIZE; j++)
				{
					int limit = enable ? outputWAVhdr.fmt.NumChannels + 1 : outputWAVhdr.fmt.NumChannels;
					for (int k = enable ? 1 : 0; k < limit; k++)
					{
						sample = sampleBuffer[k][j] * SAMPLE_SCALE;	// crude, non-rounding 			
						sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
						fwrite(&sample, outputWAVhdr.fmt.BitsPerSample / 8, 1, wav_out);
					}
				}
			}
		}


	// Close files
	//-------------------------------------------------	
	fclose(wav_in);
	fclose(wav_out);
	//-------------------------------------------------	

	return 0;
}
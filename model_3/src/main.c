#include <stdio.h>
#include <dsplib\wavefile.h>
#include <stdfix.h>
#include <stdlib.h>
#include <string.h>
#include <dsplib\timers.h>
#include <stdbool.h>
#include "common.h"
#include "processing.h"

__memY static DSPfract sampleBuffer[OUTPUT_NUM_CHANNELS + 2][BLOCK_SIZE];

// Processing related variables
//DSPfract preGain;

DSPint mode;
bool enable;
DSPfract preGain;
DSPfract history_def[6][n_coeff];
DSPfract p_state_def[6];

__memY const DSPfract coeffs_hpf_800Hz[n_coeff] =
{
		FRACT_NUM(- 0.00316622707854720970),
		FRACT_NUM(-0.00360682240777098410),
		FRACT_NUM(-0.00408710197815540920),
		FRACT_NUM(-0.00460872088614302810),
		FRACT_NUM(-0.00517317511600128620),
		FRACT_NUM(-0.00578176181366949100),
		FRACT_NUM(-0.00643553570259188230),
		FRACT_NUM(-0.00713526154125337410),
		FRACT_NUM(-0.00788136255134137300),
		FRACT_NUM(-0.00867386477977093170),
		FRACT_NUM(-0.00951233739758824450),
		FRACT_NUM(-0.01039582898436995800),
		FRACT_NUM(-0.01132279989846925900),
		FRACT_NUM(-0.01229105089164069000),
		FRACT_NUM(-0.01329764819145986200),
		FRACT_NUM(-0.01433884534677711500),
		FRACT_NUM(-0.01541000221038987800),
		FRACT_NUM(-0.01650550151930241900),
		FRACT_NUM(-0.01761866362642134200),
		FRACT_NUM(-0.01874166003828908700),
		FRACT_NUM(-0.01986542652137372100),
		FRACT_NUM(-0.02097957665429432700),
		FRACT_NUM(-0.02207231682483635700),
		FRACT_NUM(-0.02313036379827034000),
		FRACT_NUM(-0.02413886611669202600),
		FRACT_NUM(-0.02508133072716470900),
		FRACT_NUM(-0.02593955637841095400),
		FRACT_NUM(-0.02669357547060610000),
		FRACT_NUM(-0.02732160618918936700),
		FRACT_NUM(-0.02780001690004550400),
		FRACT_NUM(-0.02810330492822414200),
		FRACT_NUM(0.97160003987407328000),
		FRACT_NUM(-0.02810330492822414200),
		FRACT_NUM(-0.02780001690004550400),
		FRACT_NUM(-0.02732160618918936700),
		FRACT_NUM(-0.02669357547060610000),
		FRACT_NUM(-0.02593955637841095400),
		FRACT_NUM(-0.02508133072716470900),
		FRACT_NUM(-0.02413886611669202600),
		FRACT_NUM(-0.02313036379827034000),
		FRACT_NUM(-0.02207231682483635700),
		FRACT_NUM(-0.02097957665429432700),
		FRACT_NUM(-0.01986542652137372100),
		FRACT_NUM(-0.01874166003828908700),
		FRACT_NUM(-0.01761866362642134200),
		FRACT_NUM(-0.01650550151930241900),
		FRACT_NUM(-0.01541000221038987800),
		FRACT_NUM(-0.01433884534677711500),
		FRACT_NUM(-0.01329764819145986200),
		FRACT_NUM(-0.01229105089164069000),
		FRACT_NUM(-0.01132279989846925900),
		FRACT_NUM(-0.01039582898436995800),
		FRACT_NUM(-0.00951233739758824450),
		FRACT_NUM(-0.00867386477977093170),
		FRACT_NUM(-0.00788136255134137300),
		FRACT_NUM(-0.00713526154125337410),
		FRACT_NUM(-0.00643553570259188230),
		FRACT_NUM(-0.00578176181366949100),
		FRACT_NUM(-0.00517317511600128620),
		FRACT_NUM(-0.00460872088614302810),
		FRACT_NUM(-0.00408710197815540920),
		FRACT_NUM(-0.00360682240777098410),
		FRACT_NUM(-0.00316622707854720970),
		FRACT_NUM(-0.00276353777472146660)
};

__memY const DSPfract coeffs_lpf_18kHz[n_coeff] =
{
		FRACT_NUM(- 0.00000000078811309334),
		FRACT_NUM(0.00000000459449651027),
		FRACT_NUM(-0.00000001082145105039),
		FRACT_NUM(0.00000001690779028121),
		FRACT_NUM(-0.00000001498272246723),
		FRACT_NUM(-0.00000000973533558256),
		FRACT_NUM(0.00000007538366408270),
		FRACT_NUM(-0.00000018806459460074),
		FRACT_NUM(0.00000030825143649414),
		FRACT_NUM(-0.00000030151963327792),
		FRACT_NUM(-0.00000009884660792145),
		FRACT_NUM(0.00000124475547061359),
		FRACT_NUM(-0.00000331636037307894),
		FRACT_NUM(0.00000571828653490450),
		FRACT_NUM(-0.00000612596401920330),
		FRACT_NUM(-0.00000038846728257926),
		FRACT_NUM(0.00002086943823850771),
		FRACT_NUM(-0.00006020802221928960),
		FRACT_NUM(0.00011000658586704244),
		FRACT_NUM(-0.00012920269425582487),
		FRACT_NUM(0.00002234026989241978),
		FRACT_NUM(0.00036220496007964998),
		FRACT_NUM(-0.00116534792243818700),
		FRACT_NUM(0.00230526980269552980),
		FRACT_NUM(-0.00304206678659840360),
		FRACT_NUM(0.00131978200087745240),
		FRACT_NUM(0.00687796989129466680),
		FRACT_NUM(-0.02747195698724110700),
		FRACT_NUM(0.06623356996687372600),
		FRACT_NUM(-0.12299533637713553000),
		FRACT_NUM(0.18089698082410743000),
		FRACT_NUM(0.79343642558073291000),
		FRACT_NUM(0.18089698082410743000),
		FRACT_NUM(-0.12299533637713553000),
		FRACT_NUM(0.06623356996687372600),
		FRACT_NUM(-0.02747195698724110700),
		FRACT_NUM(0.00687796989129466680),
		FRACT_NUM(0.00131978200087745240),
		FRACT_NUM(-0.00304206678659840360),
		FRACT_NUM(0.00230526980269552980),
		FRACT_NUM(-0.00116534792243818700),
		FRACT_NUM(0.00036220496007964998),
		FRACT_NUM(0.00002234026989241978),
		FRACT_NUM(-0.00012920269425582487),
		FRACT_NUM(0.00011000658586704244),
		FRACT_NUM(-0.00006020802221928960),
		FRACT_NUM(0.00002086943823850771),
		FRACT_NUM(-0.00000038846728257926),
		FRACT_NUM(-0.00000612596401920330),
		FRACT_NUM(0.00000571828653490450),
		FRACT_NUM(-0.00000331636037307894),
		FRACT_NUM(0.00000124475547061359),
		FRACT_NUM(-0.00000009884660792145),
		FRACT_NUM(-0.00000030151963327792),
		FRACT_NUM(0.00000030825143649414),
		FRACT_NUM(-0.00000018806459460074),
		FRACT_NUM(0.00000007538366408270),
		FRACT_NUM(-0.00000000973533558256),
		FRACT_NUM(-0.00000001498272246723),
		FRACT_NUM(0.00000001690779028121),
		FRACT_NUM(-0.00000001082145105039),
		FRACT_NUM(0.00000000459449651027),
		FRACT_NUM(-0.00000000078811309334),
		FRACT_NUM(-0.00000000073932950288)
};

__memY const DSPfract coeffs_bpf[n_coeff] =
{
		FRACT_NUM(0.00051585421475756150),
		FRACT_NUM(0.00037829940828977619),
		FRACT_NUM(0.00018509088676076961),
		FRACT_NUM(-0.00007385433359121115),
		FRACT_NUM(-0.00040944831907882947),
		FRACT_NUM(-0.00083334199506689751),
		FRACT_NUM(-0.00135779159409429300),
		FRACT_NUM(-0.00199548091498102190),
		FRACT_NUM(-0.00275928944083974130),
		FRACT_NUM(-0.00366197715789331370),
		FRACT_NUM(-0.00471582330394870480),
		FRACT_NUM(-0.00593227170956588200),
		FRACT_NUM(-0.00732129629314475470),
		FRACT_NUM(-0.00889053088789169830),
		FRACT_NUM(-0.01064547852222228400),
		FRACT_NUM(-0.01258899653885877700),
		FRACT_NUM(-0.01471572339076930400),
		FRACT_NUM(-0.01701549974169424400),
		FRACT_NUM(-0.01949052523059831300),
		FRACT_NUM(-0.02211076512496125800),
		FRACT_NUM(-0.02477401648478391000),
		FRACT_NUM(-0.02757095509380784100),
		FRACT_NUM(-0.03066012935930801500),
		FRACT_NUM(-0.03305023711049896700),
		FRACT_NUM(-0.03471903136254791300),
		FRACT_NUM(-0.04044816132345094300),
		FRACT_NUM(-0.04371269929739883500),
		FRACT_NUM(-0.02521068267290438700),
		FRACT_NUM(-0.04797702947312167100),
		FRACT_NUM(-0.14997741955561741000),
		FRACT_NUM(0.24048757138350532000),
		FRACT_NUM(0.69331561432950528000),
		FRACT_NUM(0.24048757138350532000),
		FRACT_NUM(-0.14997741955561741000),
		FRACT_NUM(-0.04797702947312167100),
		FRACT_NUM(-0.02521068267290438700),
		FRACT_NUM(-0.04371269929739883500),
		FRACT_NUM(-0.04044816132345094300),
		FRACT_NUM(-0.03471903136254791300),
		FRACT_NUM(-0.03305023711049896700),
		FRACT_NUM(-0.03066012935930801500),
		FRACT_NUM(-0.02757095509380784100),
		FRACT_NUM(-0.02477401648478391000),
		FRACT_NUM(-0.02211076512496125800),
		FRACT_NUM(-0.01949052523059831300),
		FRACT_NUM(-0.01701549974169424400),
		FRACT_NUM(-0.01471572339076930400),
		FRACT_NUM(-0.01258899653885877700),
		FRACT_NUM(-0.01064547852222228400),
		FRACT_NUM(-0.00889053088789169830),
		FRACT_NUM(-0.00732129629314475470),
		FRACT_NUM(-0.00593227170956588200),
		FRACT_NUM(-0.00471582330394870480),
		FRACT_NUM(-0.00366197715789331370),
		FRACT_NUM(-0.00275928944083974130),
		FRACT_NUM(-0.00199548091498102190),
		FRACT_NUM(-0.00135779159409429300),
		FRACT_NUM(-0.00083334199506689751),
		FRACT_NUM(-0.00040944831907882947),
		FRACT_NUM(-0.00007385433359121115),
		FRACT_NUM(0.00018509088676076961),
		FRACT_NUM(0.00037829940828977619),
		FRACT_NUM(0.00051585421475756150),
		FRACT_NUM(0.00060695555446849624)
};


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
	WAVREAD_HANDLE *wav_in;
	WAVWRITE_HANDLE *wav_out;

	char WavInputName[256];
	char WavOutputName[256];

	DSPint inChannels;
	DSPint outChannels;
	DSPint bitsPerSample;
	DSPint sampleRate;
	DSPint iNumSamples;
	DSPint i;
	DSPint j;

	bool enable;
	const DSPfract varGainDB;

	unsigned long long count1, count2, spent_cycles;

	enable = true;
	mode = 0;
	varGainDB = MINUS_3DB;

	// Init channel buffers
	for (i = 0; i < OUTPUT_NUM_CHANNELS + 2; i++) {
		for (j = 0; j < BLOCK_SIZE; j++)
			sampleBuffer[i][j] = FRACT_NUM(0.0);
	}
	//-------------------------------------------------
	strcpy(WavInputName, argv[0]);
	wav_in = cl_wavread_open(WavInputName);
	if(wav_in == NULL){
		printf("Error: Could not open wavefile.\n");
		return -1;
	}

	// Read input wav header
	//-------------------------------------------------
	inChannels = cl_wavread_getnchannels(wav_in);
	bitsPerSample = cl_wavread_bits_per_sample(wav_in);
	sampleRate = cl_wavread_frame_rate(wav_in);
	iNumSamples = cl_wavread_number_of_frames(wav_in);
	//-------------------------------------------------

	// Set up output WAV header
	//-------------------------------------------------
	strcpy(WavOutputName, argv[1]);
	outChannels = enable ? OUTPUT_NUM_CHANNELS : INPUT_NUM_CHANNELS;
	wav_out = cl_wavwrite_open(WavOutputName, bitsPerSample, outChannels, sampleRate);
	if(!wav_out){
		printf("Error : Could not open wavefile.\n");
		return -1;
	}

	if (enable) /*initProcessing(varGainDB);*/ preGain = varGainDB;

	// Processing loop
	//-------------------------------------------------
	{
			int i;
			int j;
			int k;
			int sample;


			// exact file length should be handled correctly...
			for (i = 0; i < iNumSamples / BLOCK_SIZE; i++)
			{
				for (j = 0; j < BLOCK_SIZE; j++)
				{
					for (k = 0; k < inChannels; k++)
					{
						sample = cl_wavread_recvsample(wav_in);
						sampleBuffer[k][j] = rbits(sample);
					}
				}
				count1 = cl_get_cycle_count();

				if (enable) processing(sampleBuffer, sampleBuffer);

				count2 = cl_get_cycle_count();
				spent_cycles = count2 - count1;
				printf("%llu\n", spent_cycles);

				for (j = 0; j < BLOCK_SIZE; j++)
				{
					DSPint limit = enable ? outChannels + 1 : outChannels;
					for (k = enable ? 1 : 0; k < limit; k++)
					{
						sample = bitsr(sampleBuffer[k][j]);
						cl_wavwrite_sendsample(wav_out, sample);
					}
				}
			}
		}


	// Close files
	//-------------------------------------------------
	cl_wavread_close(wav_in);
	cl_wavwrite_close(wav_out);
	//-------------------------------------------------

	return 0;
}

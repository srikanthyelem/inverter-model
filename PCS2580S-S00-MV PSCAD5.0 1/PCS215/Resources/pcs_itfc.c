//C procedures
// ********************************************
#define CALL_DLL 0
/*  Call for DLL  */
#if CALL_DLL
#include <stdlib.h>
#include <stdio.h>
#include <windows.h>  
#pragma comment(lib,"../dll/PCS_Controller.lib") 
#else
#pragma comment(lib,"../Resources/PCS_Controller.lib")
#endif

double input[56] = {0};
double out[65] = {0};
int k = 0;

#if CALL_DLL
typedef int (*FUNADDR)();
_declspec(dllexport) void PCS_Controller(double* input,double* out);
#else
void PCS_Controller(double* input,double* out);
#endif

void pcs_ctrl(double* gridvolt, 
	            double* busvolt, 
	            double* setupword, 
	            double* modulecur, 
	            double* capcur, 
	            double* pqrefset, 
	            double* battmeas, 
	            double* commandword, 
		     double* tsample, 
		     double* VgridfdCoft, 
		     double* JCoft, 
		     double* DampCoft,
		     double* DroopCoft,
		     double* Gaink,
		     double* VoltHpfFreq,
		     double* VSGEn,
		     double* FrequenceTripTh,
		     double* FrequenceTripTime,
		     double* VoltageTripTh,
		     double* VoltageTripTime,
	            double* mcbdrv, 
	            double* acmdrv, 
	            double* acsscdrv, 
	            double* dccdrv, 
	            double* dcsscdrv, 
	            double* dutym1, 
	            double* dutym2, 
	            double* dutym3, 
	            double* dutym4, 
	            double* pwmen, 
	            double* debugdata1, 
	            double* debugdata2)
{
	int i = 0;
	int j = 0;

//  Call for DLL
#if CALL_DLL  
       HINSTANCE mydll = LoadLibrary("PCS_Controller.dll");
       FUNADDR pcscontrol;
       if(mydll)
       {
            pcscontrol = (FUNADDR)GetProcAddress(mydll, "PCS_Controller");
       }
       else
       {
            printf("Fail to load DLL!\n");
            system("pause");
            exit(1);
       }
#endif
	for (i = 0;i < 2; i++)
	{
		input[i] = gridvolt[k] * 1000;k++;
	}
	k = 0;

	for (i = 2;i < 4; i++)
	{
		input[i] = busvolt[k] * 1000;k++;
	}
	k = 0;

	input[4] = *setupword;

	for (i = 5;i < 8; i++)
	{
		input[i] = modulecur[k] * 1000;k++;
	}
	k = 0;

	for (i = 8;i < 10; i++)
	{
		input[i] = capcur[k] * 1000;k++;
	}
	k = 0;

	for (i = 10;i < 12; i++)
	{
		input[i] = pqrefset[k];k++;
	}
	k = 0;

	for (i = 12;i < 15; i++)
	{
		input[i] = battmeas[k] * 1000;k++;
	}
	k = 0;

	input[15] = *commandword;
	input[16] = *tsample;

	input[17] = *VgridfdCoft;
	input[18] = *JCoft;
	input[19] = *DampCoft;
	input[20] = *DroopCoft;
	input[21] = *Gaink;
	input[22] = *VoltHpfFreq;
	input[23] = *VSGEn;
	for (i = 24;i < 32; i++)
	{
		input[i] = FrequenceTripTh[k];k++;
	}
	k = 0;
	for (i = 32;i < 40; i++)
	{
		input[i] = FrequenceTripTime[k];k++;
	}
	k = 0;
	for (i = 40;i < 48; i++)
	{
		input[i] = VoltageTripTh[k];k++;
	}
	k = 0;
	for (i = 48;i < 56; i++)
	{
		input[i] = VoltageTripTime[k];k++;
	}
	k = 0;

#if CALL_DLL
	pcscontrol(input,out);
#else
	PCS_Controller(input,out);
#endif

       *mcbdrv = !out[0];

	for (j = 1;j < 5; j++)
	{
		acmdrv[k] = !out[j];k++;
	}
	k = 0;

	for (j = 5;j < 9; j++)
	{
		acsscdrv[k] = !out[j];k++;
	}
	k = 0;

	for (j = 9;j < 13; j++)
	{
		dccdrv[k] = !out[j];k++;
	}
	k = 0;

	for (j = 13;j < 17; j++)
	{
		dcsscdrv[k] = !out[j];k++;
	}
	k = 0;
	
	for (j = 17;j < 20; j++)
	{
		dutym1[k] = out[j];k++;
	}
	k = 0;

	for (j = 20;j < 23; j++)
	{
		dutym2[k] = out[j];k++;
	}
	k = 0;

	for (j = 23;j < 26; j++)
	{
		dutym3[k] = out[j];k++;
	}
	k = 0;

	for (j = 26;j < 29; j++)
	{
		dutym4[k] = out[j];k++;
	}
	k = 0;

	for (j = 29;j < 33; j++)
	{
		pwmen[k] = !out[j];k++;
	}
	k = 0;

	for (j = 33;j < 49; j++)
	{
		debugdata1[k] = out[j];k++;
	}
	k = 0;

	for (j = 49;j < 65; j++)
	{
		debugdata2[k] = out[j];k++;
	}
	k = 0;

}








/*
	Arquivo INTERFACE do programa pRAC
x,,,,,,,,,,,,,,,,,,,,,,,,,,,,
*/

typedef struct {int num, den;} TRac;

/* Prototipos das funcoes */
TRac SomaRac(TRac, TRac);
TRac SubtraiRac(TRac, TRac);
TRac MultRac(TRac, TRac);
TRac DivRac(TRac, TRac);
TRac SimplRac(TRac);
int mdc(int, int);

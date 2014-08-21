data a;
***This is a FABRICATED data set for Chapter 12 of DeShea and Toothaker's;
***Introductory Statistics for the Health Sciences;
***The context and details of the dataset are described in https://github.com/OuhscBbmc/DeSheaToothakerIntroStats/blob/master/Data/InfantCryingFakeReadme.md;

input GroupID Group $ CryingDuration;
lines;
1	Breast	31
1	Breast	32
1	Breast	44
1	Breast	45
1	Breast	26
1	Breast	30
1	Breast	27
1	Breast	39
1	Breast	36
1	Breast	34
1	Breast	22
1	Breast	23
1	Breast	35
1	Breast	46
1	Breast	31
1	Breast	34
1	Breast	31
1	Breast	22
1	Breast	36
1	Breast	38
1	Breast	23
1	Breast	46
1	Breast	34
1	Breast	39
1	Breast	22
1	Breast	31
1	Breast	33
1	Breast	42
1	Breast	50
1	Breast	25
1	Breast	31
1	Breast	50
2	Bottle	37
2	Bottle	33
2	Bottle	35
2	Bottle	56
2	Bottle	52
2	Bottle	50
2	Bottle	56
2	Bottle	50
2	Bottle	26
2	Bottle	36
2	Bottle	55
2	Bottle	35
2	Bottle	28
2	Bottle	51
2	Bottle	46
2	Bottle	34
2	Bottle	31
2	Bottle	26
2	Bottle	28
2	Bottle	30
2	Bottle	44
2	Bottle	43
2	Bottle	28
2	Bottle	37
2	Bottle	43
2	Bottle	45
2	Bottle	36
2	Bottle	42
2	Bottle	47
2	Bottle	43
2	Bottle	37
2	Bottle	49
3	Control	51
3	Control	87
3	Control	84
3	Control	51
3	Control	40
3	Control	55
3	Control	60
3	Control	53
3	Control	59
3	Control	63
3	Control	60
3	Control	74
3	Control	81
3	Control	59
3	Control	36
3	Control	74
3	Control	75
3	Control	37
3	Control	67
3	Control	50
3	Control	74
3	Control	44
3	Control	40
3	Control	69
3	Control	69
3	Control	48
3	Control	69
3	Control	40
3	Control	51
3	Control	76
3	Control	45
3	Control	76
;
proc print;
run;

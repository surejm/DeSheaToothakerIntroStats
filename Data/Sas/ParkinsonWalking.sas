data a;
***This data set is provided courtesy of Falvo and Earhart (2009);
***for use with DeShea and Toothaker's Introductory Statistics for the Health Sciences;
input SubjectID SixMinWalkInFeet TugInSeconds;
lines;
1	621	10
2	1612	8
3	1491	10
4	1584	8
5	1372	7
6	2000	8
7	841	19
8	2109	8
9	1830	10
10	1525	9
11	1472	11
12	1404	14
13	1200	12
14	1016	10
15	739	9
16	1026	17
17	1250	10
18	800	18
19	938	10
20	1192	13
21	1520	9
22	1214	9
23	1368	14
24	1971	7
25	1546	10
26	1119	14
27	1704	7
28	1603	8
29	1117	10
30	1545	7
31	958	12
32	1500	9
33	1395	8
34	1322	11
35	1204	11
36	1280	11
37	1615	7
38	1032	12
39	1111	13
40	1181	8
41	1385	8
42	992	9
43	1253	11
44	1172	9
45	1027	11
46	858	14
47	1863	8
48	522	19
49	1028	13
50	1600	7
51	1912	6
52	1000	7
53	1333	8
54	1139	11
55	974	10
56	1400	11
57	930	24
58	1000	12
59	784	17
60	1369	10
61	1289	12
62	1136	12
63	1256	10
64	1491	7
65	1459	10
66	713	20
67	1616	8
68	981	16
69	1668	7
70	1233	8
71	1400	11
72	1543	11
73	1404	9
74	1444	10
75	1386	10
;
proc print;
run;
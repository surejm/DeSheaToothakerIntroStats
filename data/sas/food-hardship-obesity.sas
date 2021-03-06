data a;
***This data set was compiled using information from www dot cdc dot gov and frac dot org;
***for DeShea and Toothaker's Introductory Statistics for the Health Sciences;
***The context and details of the dataset are described in https://github.com/OuhscBbmc/DeSheaToothakerIntroStats/blob/master/data/food-hardship-obesityReadme.md;

input StateName $ 1-18 State $ FoodHardshipRate ObesityRate Location $;
lines;
Alabama	            AL	0.234	0.32	South
Alaska	            AK	0.182	0.274	Other
Arizona	            AZ	0.205	0.247	Other
Arkansas	        AR	0.211	0.309	South
California	        CA	0.193	0.238	Other
Colorado	        CO	0.16	0.207	Other
Connecticut	        CT	0.14	0.245	Other
Delaware	        DE	0.21	0.288	South
DistrictofColumbia	DC	0.163	0.237	Other
Florida	            FL	0.216	0.266	South
Georgia	            GA	0.217	0.28	South
Hawaii	            HI	0.118	0.218	Other
Idaho	            ID	0.189	0.27	Other
Illinois	        IL	0.175	0.271	Other
Indiana	            IN	0.203	0.308	Other
Iowa	            IA	0.155	0.29	Other
Kansas	            KS	0.149	0.296	Other
Kentucky	        KY	0.223	0.304	South
Louisiana	        LA	0.213	0.334	South
Maine	            ME	0.167	0.278	Other
Maryland	        MD	0.163	0.283	South
Massachusetts	    MA	0.145	0.227	Other
Michigan	        MI	0.181	0.313	Other
Minnesota	        MN	0.126	0.257	Other
Mississippi	        MS	0.245	0.349	South
Missouri	        MO	0.195	0.303	Other
Montana	            MT	0.154	0.246	Other
Nebraska	        NE	0.144	0.284	Other
Nevada	            NV	0.200	0.245	Other
NewHampshire	    NH	0.152	0.262	Other
NewJersey	        NJ	0.158	0.237	Other
NewMexico	        NM	0.181	0.263	Other
NewYork	            NY	0.176	0.245	Other
NorthCarolina	    NC	0.211	0.291	South
NorthDakota	        ND	0.100	0.278	Other
Ohio	            OH	0.198	0.296	Other
Oklahoma	        OK	0.213	0.311	South
Oregon	            OR	0.18	0.267	Other
Pennsylvania	    PA	0.15	0.286	Other
RhodeIsland	        RI	0.181	0.254	Other
SouthCarolina	    SC	0.219	0.308	South
SouthDakota	        SD	0.152	0.281	Other
Tennessee	        TN	0.217	0.292	South
Texas	            TX	0.216	0.304	South
Utah	            UT	0.177	0.244	Other
Vermont	            VT	0.16	0.254	Other
Virginia	        VA	0.166	0.292	South
Washington	        WA	0.164	0.265	Other
WestVirginia	    WV	0.225	0.324	South
Wisconsin	        WI	0.137	0.277	Other
Wyoming	            WY	0.147	0.25	Other
;
proc print;
run;

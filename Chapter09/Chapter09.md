Chapter 09 Graphs
=================================================
This report creates the chapter graphs.

<!--  Set the working directory to the repository's base directory; this assumes the report is nested inside of only one directory.-->

```r
opts_knit$set(root.dir = "../")  #Don't combine this call with any other chunk -especially one that uses file paths.
```


<!-- Set the report-wide options, and point to the external code file. -->

```r
require(knitr)
opts_chunk$set(
  results = 'show',
  message = TRUE,
  comment = NA, 
  tidy = FALSE,
  fig.width = 5.5, 
  fig.height = 4, 
  out.width = "550px", #This affects only the markdown, not the underlying png file.  The height will be scaled appropriately.
  fig.path = 'figure_rmd/',     
  dev = "png",
#     dev = "pdf",
  dpi = 400
)
echoChunks <- FALSE
options(width=120) #So the output is 50% wider than the default.
read_chunk("./Chapter09/Chapter09.R") 
```

<!-- Load the packages.  Suppress the output when loading packages. --> 



<!-- Load any Global functions and variables declared in the R file.  Suppress the output. --> 



<!-- Declare any global functions specific to a Rmd output.  Suppress the output. --> 



<!-- Load the datasets. -->



<!-- Tweak the datasets. -->



## Figure 9-1
<img src="figure_rmd/Figure09_01.png" title="plot of chunk Figure09_01" alt="plot of chunk Figure09_01" width="550px" />


## Figure 9-2
<img src="figure_rmd/Figure09_02.png" title="plot of chunk Figure09_02" alt="plot of chunk Figure09_02" width="550px" />


## Figure 9-3
<img src="figure_rmd/Figure09_03.png" title="plot of chunk Figure09_03" alt="plot of chunk Figure09_03" width="550px" />


## Figure 9-4
<img src="figure_rmd/Figure09_04.png" title="plot of chunk Figure09_04" alt="plot of chunk Figure09_04" width="550px" />


## Figure 9-5
<img src="figure_rmd/Figure09_05.png" title="plot of chunk Figure09_05" alt="plot of chunk Figure09_05" width="550px" />


## Figure 9-6

```
Warning: Removed 74 rows containing missing values (geom_path).
Warning: Removed 74 rows containing missing values (geom_path).
```

<img src="figure_rmd/Figure09_06.png" title="plot of chunk Figure09_06" alt="plot of chunk Figure09_06" width="550px" />


## Figure 9-7
<img src="./../Chapter08/figure_rmd/Figure08_07.png" alt="TwoTails" style="width: 550px;"/>

## Figure 9-8
<img src="./../Chapter08/figure_rmd/Figure08_02.png" alt="TwoTails" style="width: 550px;"/>

## Figure 9-9
Lise, instead of side-by-side graphs, how do you feel about overlaying Figure 9-02 & 9-03, similar to what we did with [Figure 12-08](https://github.com/OuhscBbmc/DeSheaToothakerIntroStats/blob/master/Chapter12/figure_rmd/Figure12_08.png) for the *F* distribution?  If so, do you want to keep the gray horiztonal lines that say .95 and .99?

## Figure 9-10

```
Warning: Removed 74 rows containing missing values (geom_path).
Warning: Removed 74 rows containing missing values (geom_path).
```

<img src="figure_rmd/Figure09_10.png" title="plot of chunk Figure09_10" alt="plot of chunk Figure09_10" width="550px" />


## Figure 9-11
<img src="figure_rmd/Figure09_11.png" title="plot of chunk Figure09_11" alt="plot of chunk Figure09_11" width="550px" />


## Session Info
For the sake of documentation and reproducibility, the current report was build on a system using the following software.


```
Report created by Will at 2014-04-07, 22:38 Central Daylight Time
```

```
R version 3.0.3 Patched (2014-03-06 r65320)
Platform: x86_64-w64-mingw32/x64 (64-bit)

locale:
[1] LC_COLLATE=English_United States.1252  LC_CTYPE=English_United States.1252    LC_MONETARY=English_United States.1252
[4] LC_NUMERIC=C                           LC_TIME=English_United States.1252    

attached base packages:
[1] grid      stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] dichromat_2.0-0    extrafont_0.16     reshape2_1.2.2     ggthemes_1.6.0     ggplot2_0.9.3.1    gridExtra_0.9.1   
 [7] scales_0.2.3       plyr_1.8.1         RColorBrewer_1.0-5 knitr_1.5         

loaded via a namespace (and not attached):
 [1] colorspace_1.2-4 digest_0.6.4     evaluate_0.5.3   extrafontdb_1.0  formatR_0.10     gtable_0.1.2    
 [7] labeling_0.2     MASS_7.3-29      munsell_0.4.2    proto_0.3-10     Rcpp_0.11.1      Rttf2pt1_1.3    
[13] stringr_0.6.2    tools_3.0.3     
```

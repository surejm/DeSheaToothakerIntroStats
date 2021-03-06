---
output:
  html_document:
    keep_md: yes
    code_folding: hide
---
Chapter 14 Graphs
=================================================
This report creates the chapter graphs.

<!--  Set the working directory to the repository's base directory; this assumes the report is nested inside of only one directory.-->


<!-- Set the report-wide options, and point to the external code file. -->

<!-- Load the packages.  Suppress the output when loading packages. -->

```r
library(ggplot2)
requireNamespace("wesanderson")
```

<!-- Load any Global functions and variables declared in the R file.  Suppress the output. -->

```r
source("./common-code/book-theme.R")
calculatedPointCount <- 401*4

theme_chapter <- theme_book
```

<!-- Declare any global functions specific to a Rmd output.  Suppress the output. -->


<!-- Load the datasets. -->


<!-- Tweak the datasets. -->


## Figure 14-2

```r
xLimits <- c(-3.9, 3.9)
xLimitBuffer <- 3.85
parallelLineHeight <- -.08

criticalZ025 <- qnorm(p=.975) #1.959964

g1 <- ggplot(data.frame(f=xLimits), aes(x=f)) +
  stat_function(fun=dnorm, n=calculatedPointCount, color=PaletteCritical[1], size=.5)+

  annotate("segment", x=criticalZ025, xend=criticalZ025, y=0, yend=Inf, color=PaletteCritical[2]) +
  annotate("segment", x=criticalZ025, xend=xLimitBuffer, y=dnorm(criticalZ025)+.02, yend=dnorm(criticalZ025)+.02, color=PaletteCritical[2], arrow=arrow(length=grid::unit(0.2, "cm"), type="open"), lineend="round", linetype="F2") +

  annotate("segment", x=-criticalZ025, xend=-criticalZ025, y=0, yend=Inf, color=PaletteCritical[2]) +
  annotate("segment", x=-criticalZ025, xend=-xLimitBuffer, y=dnorm(-criticalZ025)+.02, yend=dnorm(-criticalZ025)+.02, color=PaletteCritical[2], arrow=arrow(length=grid::unit(0.2, "cm"), type="open"), lineend="round", linetype="F2") +

  annotate(geom="text", x=criticalZ025+.05, y=dnorm(criticalZ025)+.06, label="alpha/2==phantom(0)", hjust=0, vjust=-.15, parse=TRUE, color=PaletteCritical[2]) +
  annotate(geom="text", x=criticalZ025+.05, y=dnorm(criticalZ025)+.06, label=" .025", hjust=0, vjust=1.15, parse=F, color=PaletteCritical[2]) +
  annotate(geom="text", x=criticalZ025, y=0, label=round(criticalZ025, 3), hjust=.5, vjust=1.2, color=PaletteCritical[2], size=5) +

  annotate(geom="text", x=-criticalZ025-.05, y=dnorm(-criticalZ025)+.06, label="alpha/2==phantom(0)", hjust=1, vjust=-.15, parse=TRUE, color=PaletteCritical[2]) +
  annotate(geom="text", x=-criticalZ025-.05, y=dnorm(-criticalZ025)+.06, label=".025   ", hjust=1, vjust=1.15, parse=F, color=PaletteCritical[2]) +
  annotate(geom="text", x=-criticalZ025, y=0, label=round(-criticalZ025, 3), hjust=.5, vjust=1.2, color=PaletteCritical[2], size=5) +

  stat_function(fun=LimitRange(dnorm, criticalZ025, Inf), geom="area", color=PaletteCritical[2], fill=PaletteCriticalLight[2], n=calculatedPointCount, na.rm=T) +
  stat_function(fun=LimitRange(dnorm, -Inf, -criticalZ025), geom="area", color=PaletteCritical[2], fill=PaletteCriticalLight[2], n=calculatedPointCount, na.rm=T) +

  scale_x_continuous(expand=c(0,0), breaks=-3:3, labels=c(-3, "", -1, 0, 1, "", 3)) +
  scale_y_continuous(breaks=NULL, expand=c(0,0)) +
  coord_cartesian(xlim=c(-3.9, 3.9), ylim=c(0, dnorm(0)*1.10))  +
  theme_chapter +
  labs(x=expression(italic(z)), y=NULL)

DrawWithoutPanelClipping(g1)
```

<img src="figure-png/figure-14-02-1.png" width="400px" />

## Figure 14-3
[Steve Zissou](https://www.google.com/search?q=Steve+Zissou&espv=210&es_sm=93&tbm=isch&imgil=2g2Hl0Xn1uLPnM%253A%253Bhttps%253A%252F%252Fencrypted-tbn3.gstatic.com%252Fimages%253Fq%253Dtbn%253AANd9GcSs7l-wrHy3iVFP-U3qGDXiVc4UuWY2AIJo0WbGRJ9tnpUINC-I%253B1024%253B768%253BpIGucwvka7NrpM%253Bhttp%25253A%25252F%25252Ffuckyeahstevezissou.tumblr.com%25252Fpost%25252F11494722427%25252Fgood-moms-dress-their-children-as-steve-zissou&source=iu&usg=__NDOX2CzOV_P7y2LbbNYt2oaZ4aE%3D&sa=X&ei=Y6FEU7PfAo-S2AWn_YDICg&ved=0CLUBEP4dMA0#facrc=_&imgdii=_&imgrc=2g2Hl0Xn1uLPnM%253A%3BpIGucwvka7NrpM%3Bhttp%253A%252F%252Fwww.movies-wallpapers.net%252FMovies%252FThe%252520Life%252520Aquatic%252520With%252520Steve%252520Zissou%252FThe%252520Life%252520Aquatic%252520With%252520Steve%252520Zissou-10.jpg%3Bhttp%253A%252F%252Ffuckyeahstevezissou.tumblr.com%252Fpost%252F11494722427%252Fgood-moms-dress-their-children-as-steve-zissou%3B1024%3B768)


```r
fPaletteDark  <- adjustcolor(wesanderson::wes_palette("Darjeeling1", 5), alpha.f=.8) #https://github.com/karthik/wesanderson#wes-anderson-palettes
fPaletteLight <- adjustcolor(wesanderson::wes_palette("Darjeeling1", 5), alpha.f=.3)

f1 <- function( x ) dchisq(x, df=2)
f2 <- function( x ) dchisq(x, df=3)
f3 <- function( x ) dchisq(x, df=4)
f4 <- function( x ) dchisq(x, df=6)
f5 <- function( x ) dchisq(x, df=8)

ggplot(data.frame(f=c(0, 10.5)), aes(x=f)) +
  stat_function(fun=f1, geom="area", fill=fPaletteLight[1], n=calculatedPointCount, na.rm=T) +
  stat_function(fun=f2, geom="area", fill=fPaletteLight[2], n=calculatedPointCount, na.rm=T) +
  stat_function(fun=f3, geom="area", fill=fPaletteLight[3], n=calculatedPointCount, na.rm=T) +
  stat_function(fun=f4, geom="area", fill=fPaletteLight[4], n=calculatedPointCount, na.rm=T) +
  stat_function(fun=f5, geom="area", fill=fPaletteLight[5], n=calculatedPointCount, na.rm=T) +
  stat_function(fun=f1, n=calculatedPointCount, color=fPaletteDark[1], size=1) +
  stat_function(fun=f2, n=calculatedPointCount, color=fPaletteDark[2], size=1) +
  stat_function(fun=f3, n=calculatedPointCount, color=fPaletteDark[3], size=1) +
  stat_function(fun=f4, n=calculatedPointCount, color=fPaletteDark[4], size=1) +
  stat_function(fun=f5, n=calculatedPointCount, color=fPaletteDark[5], size=1) +
  annotate(geom="text", x=1, y=f1(1), label="italic(chi)[2]^2", hjust=-.5, vjust=-.5, parse=TRUE, color=fPaletteDark[1], size=7) +
  annotate(geom="text", x=2, y=f2(2), label="italic(chi)[3]^2", hjust=-.5, vjust=-.5, parse=TRUE, color=fPaletteDark[2], size=7) +
  annotate(geom="text", x=3, y=f3(3), label="italic(chi)[4]^2", hjust=-.5, vjust=-.5, parse=TRUE, color=fPaletteDark[3], size=7) +
  annotate(geom="text", x=4.5, y=f4(4.5), label="italic(chi)[6]^2", hjust=-.5, vjust=-.5, parse=TRUE, color=fPaletteDark[4], size=7) +
  annotate(geom="text", x=6.5, y=f5(6.5), label="italic(chi)[8]^2", hjust=-.5, vjust=-.5, parse=TRUE, color=fPaletteDark[5], size=7) +
  scale_x_continuous(expand=c(0,0)) +
  scale_y_continuous(breaks=NULL, expand=c(0,0)) +
  expand_limits(x=c(0, 10.5) -.1, y= f1(0) * 1.05) +
  theme_chapter +
  labs(x=expression(italic(chi^2)), y=NULL)
```

<img src="figure-png/figure-14-03-1.png" width="400px" />

## Figure 14-4

```r
fDf6 <- function(x) dchisq(x, df=6)
criticalF05 <- qchisq(p=.95, df=6)
chiObs <- 14.53
pObsPretty <- ".0242" #1- pchisq(q=chiObs, df=6)

grid::grid.newpage()
g3 <- ggplot(data.frame(f=c(0, 19.9)), aes(x=f)) +
  annotate("segment", x=criticalF05, xend=criticalF05, y=0, yend=Inf, color=PaletteCritical[2]) +
  annotate("segment", x=criticalF05, xend=19.5, y=fDf6(criticalF05)+.02, yend=fDf6(criticalF05)+.02, color=PaletteCritical[2], arrow=arrow(length=grid::unit(0.2, "cm"), type="open"), lineend="round", linetype="F2") +
  stat_function(fun=LimitRange(fDf6, criticalF05, Inf), geom="area", fill=PaletteCriticalLight[2], n=calculatedPointCount, na.rm=T) +
  stat_function(fun=fDf6, n=calculatedPointCount, color=PaletteCritical[1], size=.5) +
  annotate(geom="text", x=13.5, y=fDf6(criticalF05)+.035, label="alpha==phantom(0)", hjust=.5, vjust=-.15, parse=TRUE, color=PaletteCritical[2]) +
  annotate(geom="text", x=13.5, y=fDf6(criticalF05)+.035, label=".05", hjust=.5, vjust=1.15, parse=F, color=PaletteCritical[2]) +
  annotate(geom="text", x=criticalF05, y=0, label=round(criticalF05, 2), hjust=.5, vjust=1.2, color=PaletteCritical[2], size=5) +

  annotate("text", label="italic(H)[0]: distribution[population]==distribution[theory]", x=1, y=Inf, parse=T, size=4.5, hjust=0, vjust=1.08, color="gray40") +

  scale_x_continuous(expand=c(0,0), breaks=seq(0, 20, 2), labels=c(0, 2, 4, 6, 8, 10, "", 14, 16, 18, 20)) +
  scale_y_continuous(breaks=NULL, expand=c(0,0)) +
  expand_limits(y=fDf6(4) * 1.1) +
  theme_chapter +
  theme(axis.text = element_text(colour="gray60")) + #Lighten so the critical values aren't interfered with
  labs(x=expression(italic(chi^2)), y=NULL)

DrawWithoutPanelClipping(g3)
```

<img src="figure-png/figure-14-04-1.png" width="400px" />

## Figure 14-6

```r
g4 <- g3 +
  annotate("segment", x=chiObs, xend=chiObs, y=0, yend=Inf, color=PaletteCritical[4]) +
  annotate("segment", x=chiObs, xend=19.5, y=fDf6(chiObs)+.004, yend=fDf6(chiObs)+.004, color=PaletteCritical[4], arrow=arrow(length=grid::unit(0.2, "cm"), type="open"), lineend="round", linetype="F2") +
  stat_function(fun=LimitRange(fDf6, chiObs, Inf), geom="area", fill=PaletteCriticalLight[4], n=calculatedPointCount, na.rm=T) +
  annotate(geom="text", x=15.5, y=fDf6(chiObs)+.018, label="italic(p)==phantom(0)", hjust=.5, vjust=-.15, parse=TRUE, color=PaletteCritical[4]) +
  annotate(geom="text", x=15.5, y=fDf6(chiObs)+.018, label=pObsPretty, hjust=.5, vjust=1.15, parse=F, color=PaletteCritical[4]) +
  annotate(geom="text", x=chiObs, y=0, label=chiObs, hjust=.5, vjust=1.2, color=PaletteCritical[4], size=5)

DrawWithoutPanelClipping(g4)
```

<img src="figure-png/figure-14-06-1.png" width="400px" />

## Figure 14-10

```r
fDf2 <- function(x) dchisq(x, df=2)
criticalF05 <- qchisq(p=.95, df=2)
# chiObs <- 14.53
# pObsPretty <- ".0242" #1- pchisq(q=chiObs, df=6)

grid::grid.newpage()
g5 <- ggplot(data.frame(f=c(0, 9.9)), aes(x=f)) +
  annotate("segment", x=criticalF05, xend=criticalF05, y=0, yend=Inf, color=PaletteCritical[2]) +
  annotate("segment", x=criticalF05, xend=9.7, y=fDf2(criticalF05)+.02, yend=fDf2(criticalF05)+.02, color=PaletteCritical[2], arrow=arrow(length=grid::unit(0.2, "cm"), type="open"), lineend="round", linetype="F2") +
  stat_function(fun=LimitRange(fDf2, criticalF05, Inf), geom="area", fill=PaletteCriticalLight[2], n=calculatedPointCount, na.rm=T) +
  stat_function(fun=fDf2, n=calculatedPointCount, color=PaletteCritical[1], size=.5) +
  annotate(geom="text", x=6.5, y=fDf2(criticalF05)+.07, label="alpha==phantom(0)", hjust=.5, vjust=-.15, parse=TRUE, color=PaletteCritical[2]) +
  annotate(geom="text", x=6.5, y=fDf2(criticalF05)+.07, label=".05", hjust=.5, vjust=1.15, parse=F, color=PaletteCritical[2]) +
  annotate(geom="text", x=criticalF05, y=0, label=round(criticalF05, 2), hjust=.5, vjust=1.2, color=PaletteCritical[2], size=5) +

  annotate("text", label="italic(H)[0]:phantom(0)", x=1, y=Inf, parse=T, size=4.5, hjust=1, vjust=1.08, color="gray40") +
  annotate("text", label="blood sugar control is independent of treatment", x=1, y=Inf, parse=F, size=4.5, hjust=0, vjust=1.08, color="gray40") +
  scale_x_continuous(expand=c(0,0), breaks=0:6*2, labels=c(0, 2, 4, "", 8, 10, 12)) +
  scale_y_continuous(breaks=NULL, expand=c(0,0)) +
  expand_limits(y=fDf2(0) * 1.05) +
  theme_chapter +
  theme(axis.text = element_text(colour="gray60")) + #Lighten so the critical values aren't interfered with
  labs(x=expression(italic(chi^2)), y=NULL)

DrawWithoutPanelClipping(g5)
```

<img src="figure-png/figure-14-10-1.png" width="400px" />

<!-- The footer that's common to all reports. -->

## Session Information

For the sake of documentation and reproducibility, the current report was rendered in the following environment.  Click the line below to expand.

<details>
  <summary>Environment <span class="glyphicon glyphicon-plus-sign"></span></summary>

```
- Session info ---------------------------------------------------------------
 setting  value                                      
 version  R version 3.5.1 Patched (2018-09-10 r75281)
 os       Windows >= 8 x64                           
 system   x86_64, mingw32                            
 ui       RStudio                                    
 language (EN)                                       
 collate  English_United States.1252                 
 ctype    English_United States.1252                 
 tz       America/Chicago                            
 date     2018-10-25                                 

- Packages -------------------------------------------------------------------
 package          * version    date       lib source                          
 assertthat         0.2.0      2017-04-11 [1] CRAN (R 3.5.0)                  
 backports          1.1.2      2017-12-13 [1] CRAN (R 3.5.0)                  
 base64enc          0.1-3      2015-07-28 [1] CRAN (R 3.5.0)                  
 bindr              0.1.1      2018-03-13 [1] CRAN (R 3.5.0)                  
 bindrcpp           0.2.2      2018-03-29 [1] CRAN (R 3.5.0)                  
 callr              3.0.0      2018-08-24 [1] CRAN (R 3.5.1)                  
 cli                1.0.1      2018-09-25 [1] CRAN (R 3.5.1)                  
 colorspace         1.3-2      2016-12-14 [1] CRAN (R 3.5.0)                  
 crayon             1.3.4      2017-09-16 [1] CRAN (R 3.5.0)                  
 crosstalk          1.0.0      2016-12-21 [1] CRAN (R 3.5.0)                  
 debugme            1.1.0      2017-10-22 [1] CRAN (R 3.5.0)                  
 desc               1.2.0      2018-05-01 [1] CRAN (R 3.5.0)                  
 devtools           2.0.0      2018-10-19 [1] CRAN (R 3.5.1)                  
 dichromat          2.0-0      2013-01-24 [1] CRAN (R 3.5.0)                  
 digest             0.6.18     2018-10-10 [1] CRAN (R 3.5.1)                  
 dplyr              0.7.7      2018-10-16 [1] CRAN (R 3.5.1)                  
 epade              0.3.8      2013-02-22 [1] CRAN (R 3.5.1)                  
 evaluate           0.12       2018-10-09 [1] CRAN (R 3.5.1)                  
 extrafont          0.17       2014-12-08 [1] CRAN (R 3.5.0)                  
 extrafontdb        1.0        2012-06-11 [1] CRAN (R 3.5.0)                  
 fansi              0.4.0      2018-10-05 [1] CRAN (R 3.5.1)                  
 fs                 1.2.6      2018-08-23 [1] CRAN (R 3.5.1)                  
 ggplot2          * 3.0.0      2018-07-03 [1] CRAN (R 3.5.1)                  
 glue               1.3.0      2018-07-17 [1] CRAN (R 3.5.1)                  
 gridExtra          2.3        2017-09-09 [1] CRAN (R 3.5.0)                  
 gtable             0.2.0      2016-02-26 [1] CRAN (R 3.5.0)                  
 hms                0.4.2.9001 2018-08-09 [1] Github (tidyverse/hms@979286f)  
 htmltools          0.3.6      2017-04-28 [1] CRAN (R 3.5.0)                  
 htmlwidgets        1.3        2018-09-30 [1] CRAN (R 3.5.1)                  
 httpuv             1.4.5      2018-07-19 [1] CRAN (R 3.5.1)                  
 jsonlite           1.5        2017-06-01 [1] CRAN (R 3.5.0)                  
 knitr            * 1.20       2018-02-20 [1] CRAN (R 3.5.0)                  
 labeling           0.3        2014-08-23 [1] CRAN (R 3.5.0)                  
 later              0.7.5      2018-09-18 [1] CRAN (R 3.5.1)                  
 lazyeval           0.2.1      2017-10-29 [1] CRAN (R 3.5.0)                  
 magrittr           1.5        2014-11-22 [1] CRAN (R 3.5.0)                  
 manipulateWidget   0.10.0     2018-06-11 [1] CRAN (R 3.5.0)                  
 memoise            1.1.0      2017-04-21 [1] CRAN (R 3.5.0)                  
 mime               0.6        2018-10-05 [1] CRAN (R 3.5.1)                  
 miniUI             0.1.1.1    2018-05-18 [1] CRAN (R 3.5.0)                  
 munsell            0.5.0      2018-06-12 [1] CRAN (R 3.5.0)                  
 packrat            0.4.9-3    2018-06-01 [1] CRAN (R 3.5.0)                  
 pacman             0.5.0      2018-10-22 [1] CRAN (R 3.5.1)                  
 pillar             1.3.0      2018-07-14 [1] CRAN (R 3.5.1)                  
 pkgbuild           1.0.2      2018-10-16 [1] CRAN (R 3.5.1)                  
 pkgconfig          2.0.2      2018-08-16 [1] CRAN (R 3.5.1)                  
 pkgload            1.0.1      2018-10-11 [1] CRAN (R 3.5.1)                  
 plotrix            3.7-4      2018-10-03 [1] CRAN (R 3.5.1)                  
 plyr               1.8.4      2016-06-08 [1] CRAN (R 3.5.0)                  
 prettyunits        1.0.2      2015-07-13 [1] CRAN (R 3.5.0)                  
 processx           3.2.0      2018-08-16 [1] CRAN (R 3.5.1)                  
 promises           1.0.1      2018-04-13 [1] CRAN (R 3.5.0)                  
 ps                 1.2.0      2018-10-16 [1] CRAN (R 3.5.1)                  
 purrr              0.2.5      2018-05-29 [1] CRAN (R 3.5.0)                  
 R6                 2.3.0      2018-10-04 [1] CRAN (R 3.5.1)                  
 RColorBrewer       1.1-2      2014-12-07 [1] CRAN (R 3.5.0)                  
 Rcpp               0.12.19    2018-10-01 [1] CRAN (R 3.5.1)                  
 readr              1.2.0      2018-10-25 [1] Github (tidyverse/readr@69c9fd3)
 remotes            2.0.1      2018-10-19 [1] CRAN (R 3.5.1)                  
 reshape2           1.4.3      2017-12-11 [1] CRAN (R 3.5.0)                  
 rgl                0.99.16    2018-03-28 [1] CRAN (R 3.5.0)                  
 rlang              0.3.0.1    2018-10-25 [1] CRAN (R 3.5.1)                  
 rmarkdown          1.10       2018-06-11 [1] CRAN (R 3.5.0)                  
 rprojroot          1.3-2      2018-01-03 [1] CRAN (R 3.5.0)                  
 Rttf2pt1           1.3.7      2018-06-29 [1] CRAN (R 3.5.0)                  
 scales             1.0.0      2018-08-09 [1] CRAN (R 3.5.1)                  
 sessioninfo        1.1.0      2018-09-25 [1] CRAN (R 3.5.1)                  
 shiny              1.1.0      2018-05-17 [1] CRAN (R 3.5.0)                  
 stringi            1.2.4      2018-07-20 [1] CRAN (R 3.5.1)                  
 stringr            1.3.1      2018-05-10 [1] CRAN (R 3.5.0)                  
 testthat           2.0.1      2018-10-13 [1] CRAN (R 3.5.1)                  
 tibble             1.4.2      2018-01-22 [1] CRAN (R 3.5.0)                  
 tidyr              0.8.1      2018-05-18 [1] CRAN (R 3.5.0)                  
 tidyselect         0.2.5      2018-10-11 [1] CRAN (R 3.5.1)                  
 usethis            1.4.0      2018-08-14 [1] CRAN (R 3.5.1)                  
 utf8               1.1.4      2018-05-24 [1] CRAN (R 3.5.0)                  
 webshot            0.5.1      2018-09-28 [1] CRAN (R 3.5.1)                  
 wesanderson        0.3.6      2018-04-20 [1] CRAN (R 3.5.1)                  
 withr              2.1.2      2018-03-15 [1] CRAN (R 3.5.0)                  
 xtable             1.8-3      2018-08-29 [1] CRAN (R 3.5.1)                  
 yaml               2.2.0      2018-07-25 [1] CRAN (R 3.5.1)                  

[1] D:/Projects/RLibraries
[2] D:/Users/Will/Documents/R/win-library/3.5
[3] C:/Program Files/R/R-3.5.1patched/library
```
</details>



Report rendered by Will at 2018-10-25, 13:04 -0500 in 6 seconds.


## License

<a rel="license" href="http://creativecommons.org/licenses/by/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by/3.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0 Unported License</a>.

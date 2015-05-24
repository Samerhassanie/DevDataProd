---
title       : The Corr
subtitle    : A simple Shiny application for linear regression models
author      : Samer Hassanie
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---
<style>
em {
  font-style: italic
}
</style>

<style>
strong {
  font-weight: bold;
}
</style>

## Motivation

In the data science, usually one is faced with the following tasks:

1. Building linear regression models
2. Finding correlations between certain set of variables

For this, *The Corr* is a simple app, that automizes this process. However, in
its current version, the application uses existing datasets from the *datasets*
package. 

--- 

## The datasets

Some transformations have been done to the datasets.

-The following variables in the dataset *mtcars* have been transformed into factor 
variables: **cyl, vs, am, gear and carb**  
-The following variable in the dataset *ToothGrowth* has been transformed into a factor
variable: **dose**  


To give an idea about the datasets, the list of variables in each dataset is give below:

1. **mtcars**: mpg, cyl, disp, hp, drat, wt, qsec, vs, am, gear, carb
2. **ToothGrowth**: len, supp, dose
3. **iris**: Sepal.Length, Sepal.Width, Petal.Length, Petal.Width, Species

---

## The Pairs plot

Below is an example of the output corresponding to the pairs plot: 


```r
require('datasets')
pairs(mtcars)
```

<img src="assets/fig/unnamed-chunk-1-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" style="display: block; margin: auto auto auto 0;" />

---

## The Pairs plot

Below is an example of the outcome selection, regressor selection and the corresponding model output: 

<img src="assets/img/img2.png" width="900px" height="400px" align="middle"/>


As it can be seen, also there is an option to download the linear model results as a pdf file.



---
title       : Wage Prediction
subtitle    : Predicting wages based on age, job class and education of workers
author      : 
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

* This shiny app provides a prediction model for predicting wages of workers

* The prediction model is built on the Wage data set in the ISLR package

* The data set consists of Wage and other data like age, education, job class etc for a group of 3000 workers in the Mid-Atlantic region

* The prediction algorithm is based on a linear model where wages of workers are predicted based on age, job class, education and whether the worker has health insurance or not. 


--- 

## About the data set

The predictor variables used in the linear model are age, job class, education and health insurance to predict wage of the worker. Summary for these data variables can be found below.


```r
library(ISLR)
data(Wage)
Wage <- subset(Wage,select=c(wage,age,education,jobclass,health_ins))
summary(Wage)
```

```
##       wage             age                     education  
##  Min.   : 20.09   Min.   :18.00   1. < HS Grad      :268  
##  1st Qu.: 85.38   1st Qu.:33.75   2. HS Grad        :971  
##  Median :104.92   Median :42.00   3. Some College   :650  
##  Mean   :111.70   Mean   :42.41   4. College Grad   :685  
##  3rd Qu.:128.68   3rd Qu.:51.00   5. Advanced Degree:426  
##  Max.   :318.34   Max.   :80.00                           
##            jobclass     health_ins  
##  1. Industrial :1544   1. Yes:2083  
##  2. Information:1456   2. No : 917  
##                                     
##                                     
##                                     
## 
```

--- 


## About the App

Below is a quick snapshot of how the app looks like
<div style='text-align: center;'>
    <img height='400' src='assets/img/app.png' />
</div>

The shiny app can be accessed from <a href="https://murali4lp.shinyapps.io/ShinyApp-WagesData">here</a>

--- 

## Instructions for using the App

1) The user needs to select values for age, job class, education and health insurance.

2) The user then needs to click on submit.

3) Based on the values selected by the user, the app provides the predicted wage for the worker based on the prediction algorithm executed in the back end server.

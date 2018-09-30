[![Build Status](https://travis-ci.com/bautheac/fewISOs.svg?branch=master)](https://travis-ci.com/bautheac/fewISOs)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/bautheac/fewISOs?branch=master&svg=true)](https://ci.appveyor.com/project/bautheac/fewISOs)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)


# fewISOs

Provides a collection of ISO code datasets conveniently packaged for consumption in R. 


## Installation

Install the development version from [github](https://github.com/bautheac/fewISOs/) with:

``` r

devtools::install_github(repo = "fewISOs", username = "bautheac")

```

## Example

Worldwide exchanges and corresponding ISO 10383 Market Identification Codes (MIC)

``` r
library(fewISOs)

data(list = c("exchanges"), package = "fewISOs", envir = environment())

```



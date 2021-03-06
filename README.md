fewISOs
================

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

<style> body {text-align: justify} </style>

<!-- README.md is generated from README.Rmd. Please edit that file -->

[fewISOs](https://github.com/bautheac/fewISOs/) provides a collection of
financial economics related ISO code datasets conveniently packaged for
consumption in R.  
Install the development version from github using:
`devtools::install_github("bautheac/fewISOs")`.

### Countries

The `countries` dataset corresponds to the ISO 3166-1 sub-standard, part
of the ISO 3166 standard published by the International Organization for
Standardization (ISO) that defines codes for the names of countries,
dependent territories, special areas of geographical interest, and their
principal subdivisions (e.g., provinces or states). The sub-standard
comes in three sets of country codes, all provided in the dataset:

  - ISO 3166-1 alpha-2: two-letter country codes (most widely used).  
  - ISO 3166-1 alpha-3: three-letter country codes. Allows for a better
    visual association between the codes and the country names than the
    alpha-2 codes.  
  - ISO 3166-1 numeric: three-digit country codes. These are identical
    to those developed and maintained by the United Nations Statistics
    Division, with the advantage of script (writing system)
    independence, and hence useful for people or systems using non-Latin
    scripts.

<!-- end list -->

``` r
library(fewISOs)

head(countries)
#>             name alpha 2 alpha 3 numeric          capital
#> 1    Afghanistan      AF     AFG     004            Kabul
#> 2  Åland Islands      AX     ALA     248        Mariehamn
#> 3        Albania      AL     ALB     008           Tirana
#> 4        Algeria      DZ     DZA     012          Algiers
#> 5 American Samoa      AS     ASM     016        Pago Pago
#> 6        Andorra      AD     AND     020 Andorra la Vella
```

### Currencies

The `currencies` dataset corresponds to the ISO 4217 standard that
defines codes for worldwide currencies and comes as a three-letter
alphabetic as well as an alternative three-digit numeric code, both
provided in the dataset. The ISO 4217 three-letter alphabetic code
standard is based on the ISO 3166-1 code standard for countries with the
first two letters corresponding the ISO 3166-1 alpha-2 code for the
country issuing the corresponding currency and the third corresponding
to the first letter of the currency name when possible. The three-digit
numeric code is the same as the ISO 3166-1 numeric code for the issuing
country when possible.

``` r
head(currencies)
#>                            name alphabetic numeric minor unit country
#> 1                    UAE Dirham        AED     784          2      AE
#> 2                       Afghani        AFN     971          2      AF
#> 3                           Lek        ALL     008          2      AL
#> 4                 Armenian Dram        AMD     051          2      AM
#> 5 Netherlands Antillean Guilder        ANG     532          2      CW
#> 6                        Kwanza        AOA     973          2      AO
```

### Exchanges

The exchanges dataset corresponds to the ISO 10383 standard that defines
four alphanumeric character Market Identifier Codes (MIC). These are
unique identification codes used to identify securities trading
exchanges, trading platforms and regulated or non-regulated markets as
sources of prices and related information in order to facilitate
automated processing.

``` r
head(exchanges)
#>                                       name  MIC country         city
#> 1                                    zobex ZOBX      DE       Berlin
#> 2 zurcher kantonalbank securities exchange ZKBX      CH       Zurich
#> 3          jse currency derivatives market ZFXM      ZA Johannesburg
#> 4                                    zar x ZARX      ZA Johannesburg
#> 5              zagreb stock exchange - apa ZAPA      HR       Zagreb
#> 6     jse interest rate derivatives market YLDX      ZA Johannesburg
#>                website
#> 1 www.boerse-berlin.de
#> 2           www.zkb.ch
#> 3        www.jse.co.za
#> 4       www.zarx.co.za
#> 5           www.zse.hr
#> 6     www.yieldx.co.za
```

### finRes

Although [fewISOs](https://github.com/bautheac/fewISOs/) is
self-contained it belongs to the
[finRes](https://bautheac.github.io/finRes/) suite of packages where it
helps with data wrangling and analysis.

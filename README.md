fewISOs
================

[![Build
Status](https://travis-ci.com/bautheac/fewISOs.svg?branch=master)](https://travis-ci.com/bautheac/fewISOs)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/bautheac/fewISOs?branch=master&svg=true)](https://ci.appveyor.com/project/bautheac/fewISOs)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

<style> body {text-align: justify} </style>

<!-- README.md is generated from README.Rmd. Please edit that file -->

## fewISOs

fewISOs provides a collection of financial economics related ISO code
datasets conveniently packaged for consumption in R. Install the
development version from [github](https://github.com/bautheac/fewISOs/)
using: `devtools::install_github("bautheac/fewISOs")`.

### countries

The countries dataset corresponds to the ISO 3166-1 sub-standard, part
of the ISO 3166 standard published by the International Organization for
Standardization (ISO) that defines codes for the names of countries,
dependent territories, special areas of geographical interest, and their
principal subdivisions (e.g., provinces or states). The sub-standard
comes in three sets of country codes, all provided in the dataset:  
\- ISO 3166-1 alpha-2: two-letter country codes (most widely used).  
\- ISO 3166-1 alpha-3: three-letter country codes. Allows for a better
visual association between the codes and the country names than the
alpha-2 codes.  
\- ISO 3166-1 numeric: three-digit country codes. These are identical to
those developed and maintained by the United Nations Statistics
Division, with the advantage of script (writing system) independence,
and hence useful for people or systems using non-Latin scripts.

Dataset excerpt:

    #>             name alpha 2 alpha 3 numeric          capital
    #> 1    Afghanistan      AF     AFG     004            Kabul
    #> 2  Åland Islands      AX     ALA     248        Mariehamn
    #> 3        Albania      AL     ALB     008           Tirana
    #> 4        Algeria      DZ     DZA     012          Algiers
    #> 5 American Samoa      AS     ASM     016        Pago Pago
    #> 6        Andorra      AD     AND     020 Andorra la Vella

### currencies

The currencies dataset corresponds to the ISO 4217 standard that defines
codes for worldwide currencies and comes as a three-letter alphabetic as
well as an alternative three-digit numeric code, both provided in the
dataset. The ISO 4217 three-letter alphabetic code standard is based on
the ISO 3166-1 code standard for countries with the first two letters
corresponding the ISO 3166-1 alpha-2 code for the country issuing the
corresponding currency and the third corresponding to the first letter
of the currency name when possible. The three-digit numeric code is the
same as the ISO 3166-1 numeric code for the issuing country when
possible.

Dataset
    excerpt:

    #>                            name alphabetic numeric minor unit country
    #> 1                    UAE Dirham        AED     784          2      AE
    #> 2                       Afghani        AFN     971          2      AF
    #> 3                           Lek        ALL     008          2      AL
    #> 4                 Armenian Dram        AMD     051          2      AM
    #> 5 Netherlands Antillean Guilder        ANG     532          2      CW
    #> 6                        Kwanza        AOA     973          2      AO

### exchanges

The exchanges dataset corresponds to the ISO 10383 standard that defines
four alphanumeric character Market Identifier Codes (MIC). These are
unique identification codes used to identify securities trading
exchanges, trading platforms and regulated or non-regulated markets as
sources of prices and related information in order to facilitate
automated processing.

Dataset excerpt:

    #>                                               name  MIC country
    #> 1664                                    assent ats AATS      US
    #> 1665                         athens exchange - apa AAPA      GR
    #> 1666 credit agricole cib - systematic internaliser AACA      FR
    #> 1667                                           a2x A2XX      ZA
    #> 1668                                          360t 360T      DE
    #> 1669             ssy futures ltd -  freight screen 3579      GB
    #>              city           website
    #> 1664  Jersey City   www.sungard.com
    #> 1665       Athens www.athexgroup.gr
    #> 1666        Paris    www.ca-cib.com
    #> 1667 Johannesburg     www.a2x.co.za
    #> 1668    Frankfurt      www.360t.com
    #> 1669       London www.ssyonline.com

### finRes

Although fewISOs is self-contained with consumption value on its own, it
belongs to [finRes](https://bautheac.github.io/finRes/) where it helps
with data wrangling and exploration.

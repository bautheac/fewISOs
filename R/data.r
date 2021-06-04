#' ISO codes for worldwide financial exchanges.
#'
#' @description The Market Identifier Code (MIC) is a unique identification code used to
#'   identify securities trading exchanges. I's a four alphanumeric character code, and
#'   is defined by the International Organization for Standardization (ISO) in ISO 10383
#'   which 'specifies a universal method of identifying exchanges, trading platforms and
#'   regulated or non-regulated markets as sources of prices and related information in
#'   order to facilitate automated processing'.
#'
#' @format A data.table. Columns include:
#' \itemize{
#'   \item{name: institution name.}
#'   \item{MIC: ISO 10383 Market Identification Code.}
#'   \item{country: country where the exchange sits. ISO 3166-1 - aplha 2 code.}
#'   \item{city: city where the exchange sits.}
#'   \item{website: institution's website.}
#' }
#'
#' @source \url{http://www.iso20022.org}.
#' @seealso
#' \itemize{
#'   \item{\code{\link{countries}} dataset in this package.}
#'   \item{\code{storethat} package from the \code{finRes} universe.}
#' }
#'
"exchanges"

#' ISO codes for world countries.
#'
#' @description The countries dataset corresponds to the ISO 3166-1 sub-standard,
#'   part of the ISO 3166 standard published by the International Organization for
#'   Standardization (ISO) that defines codes for the names of countries, dependent
#'   territories, special areas of geographical interest, and their principal
#'   subdivisions (e.g., provinces or states). The ISO 3166-1 sub-standard defines
#'   three sets of country codes, all provided in the dataset:
#'   \itemize{
#'     \item{alpha-2: two-letter country codes (most widely used).}
#'     \item{alpha-3: three-letter country codes. Allows for a better visual
#'     association between the codes and the country names than the alpha-2 codes.}
#'     \item{numeric: three-digit country codes. These are identical to those
#'     developed and maintained by the United Nations Statistics Division, with the
#'     advantage of script (writing system) independence, and hence useful for people
#'     or systems using non-Latin scripts.}
#'   }
#'
#' @format A data.table with columns:
#' \itemize{
#'   \item{name: country name. From United Nations sources (Terminology Bulletin Country
#'     Names and the Country and Region Codes for Statistical Use maintained by the United
#'     Nations Statistics Divisions).}
#'   \item{alpha 2: ISO 3166-1 two-letter alphabetic code.}
#'   \item{alpha 3: ISO 3166-1 three-letter alphabetic code.}
#'   \item{numeric: ISO 3166-1 three-digit numeric code.}
#'   \item{capital: country's capital city.}
#' }
#'
#' @source \url{http://www.iso.org/iso-3166-country-codes.html}.
#' @seealso \code{storethat} package from the \code{finRes} universe.
#'
"countries"

#' ISO codes for worldwide currencies.
#'
#' @description The currencies dataset corresponds to the ISO 4217 standard published by the
#' International Organization for Standardization (ISO) that defines codes for worldwide
#' currencies and comes as a three-letter alphabetic as well as an alternative three-digit
#' numeric code, both provided in the dataset. The ISO 4217 three-letter alphabetic code
#' standard is based on the ISO 3166-1 code standard for countries with the first two letters
#' corresponding the ISO 3166-1 alpha-2 code for the country issuing the corresponding
#' currency and the third corresponding to the first letter of the currency name when possible.
#' Where possible the three-digit numeric code is the same as the ISO 3166-1 numeric code
#' for the issuing country.
#'
#' @format A data.table. Columns include:
#' \itemize{
#'   \item{name: currency name.}
#'   \item{alphabetic: ISO 4217 three-letter alphabetic code.}
#'   \item{numeric: ISO 4217 three-digit numeric code.}
#'   \item{minor unit: number of digits after the decimal separator.}
#'   \item{country: country where the currency is issued. ISO 3166-1 - aplha 2 code.}
#' }
#'
#' @source \url{http://www.iso.org/iso-4217-currency-codes.html}.
#' @seealso
#' \itemize{
#'   \item{\code{\link{countries}} dataset in this package.}
#'   \item{\code{storethat} package from the \code{finRes} universe.}
#' }
#'
"currencies"


#' ISOs for worldwide financial exchanges.
#'
#' @description ISO 10383 Market Identification Codes (MIC) for worldwide financial exchanges.
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

#' ISOs for world countries.
#'
#' @description ISO 3166-1 country codes.
#'
#' @format A data.table. Columns include:
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

#' ISOs for worldwide currencies.
#'
#' @description ISO 4217 codes for worldwide currencies. Both alphabetic and numeric codes are provided.
#'   The ISO 4217 three-letter alphabetic code standard is based on the ISO 3166 code standard for countries.
#'   The first two letters of the ISO 4217 alphabetic code are the same as the code for the country name,
#'   and where possible the third letter corresponds to the first letter of the currency name.
#'   The ISO 4217 three-digit numeric code is useful when currency codes need to be understood in countries
#'   that do not use Latin scripts and for computerised systems. Where possible the three-digit numeric code
#'   is the same as the numeric ISO 3166 country code.
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


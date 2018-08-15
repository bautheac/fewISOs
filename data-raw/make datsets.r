options(usethis.full_name = "Olivier Bauthéac")
usethis::use_data_raw()
usethis::use_cc0_license()
usethis::use_readme_md()




library(magrittr)

names_to_lower <- function(x){
  stringi::stri_split_fixed(x, " ", simplify = T) %>% unlist %>% tolower() %>% apply(FUN = function(y) {
    ifelse(nchar(y[nchar(y) > 0L]) > 2L, paste(toupper(substr(y[nchar(y) > 0L], 1L, 1L)), substr(y[nchar(y) > 0L], 2L, nchar(y[nchar(y) > 0L])), sep = ""), y[nchar(y) > 0L]) %>%
      paste(., collapse = " ")
  }, MARGIN = 1L)
}

parse_json_country_code.fun <- function(x){
  names <- if (is.null(x$`ISO4217-currency_name`)) NA
  else stringi::stri_split_fixed(x$`ISO4217-currency_name`, pattern = ",") %>% unlist

  `code alphas` <- if (is.null(x$`ISO4217-currency_alphabetic_code`)) NA
  else stringi::stri_split_fixed(x$`ISO4217-currency_alphabetic_code`, pattern = ",") %>% unlist

  `code nums` <- if (is.null(x$`ISO4217-currency_numeric_code`)) NA
  else stringi::stri_split_fixed(x$`ISO4217-currency_numeric_code`, pattern = ",") %>% unlist

  `minor units` <- if (is.null(x$`ISO4217-currency_minor_unit`)) NA
  else stringi::stri_split_fixed(x$`ISO4217-currency_minor_unit`, pattern = ",") %>% unlist

  `country codes` <- if (is.null(x$`ISO3166-1-Alpha-2`)) NA
  else stringi::stri_split_fixed(x$`ISO3166-1-Alpha-2`, pattern = ",") %>% unlist

  tibble::tibble(name = names, alphabetic = `code alphas`, `numeric` = `code nums`,
                 `minor unit` = `minor units`, country = `country codes`)
}



exchanges <- read.csv(file = "https://www.iso20022.org/sites/default/files/ISO10383_MIC/ISO10383_MIC.csv", stringsAsFactors = F) %>%
  dplyr::mutate_at(dplyr::vars(COUNTRY, CITY), dplyr::funs(names_to_lower(.))) %>%
  dplyr::mutate_at(dplyr::vars(NAME.INSTITUTION.DESCRIPTION, WEBSITE, STATUS, COMMENTS), dplyr::funs(tolower(.))) %>%
  dplyr::select(NAME.INSTITUTION.DESCRIPTION, MIC, ISO.COUNTRY.CODE..ISO.3166., CITY, WEBSITE) %>%
  setNames(c("name", "MIC", "country", "city", "website")) %>%
  dplyr::mutate(name = forcats::as_factor(name))
Encoding(levels(exchanges$name)) <- "latin1"
levels(exchanges$name) <- iconv( levels(exchanges$name), "latin1", "UTF-8")
exchanges %<>%
  dplyr::mutate(name = as.character(name)) %>%
  data.table::as.data.table()
usethis::use_data(exchanges, overwrite = TRUE)






data.json <- rjson::fromJSON(file = "https://datahub.io/core/country-codes/r/country-codes.json")
countries <- lapply(seq_along(data.json), function(x)
  tibble::tibble(name = ifelse(is.null(data.json[[x]]$official_name_en), NA, data.json[[x]]$official_name_en),
                 `alpha 2` = ifelse(is.null(data.json[[x]]$`ISO3166-1-Alpha-2`), NA, data.json[[x]]$`ISO3166-1-Alpha-2`),
                 `alpha 3` = ifelse(is.null(data.json[[x]]$`ISO3166-1-Alpha-3`), NA, data.json[[x]]$`ISO3166-1-Alpha-3`),
                 numeric = ifelse(is.null(data.json[[x]]$`ISO3166-1-numeric`), NA, data.json[[x]]$`ISO3166-1-numeric`),
                 capital = ifelse(is.null(data.json[[x]]$Capital), NA, data.json[[x]]$Capital))
) %>%
  do.call(what = rbind, args = .) %>%
  dplyr::mutate(name = dplyr::if_else(`alpha 2` == "TW", "Taiwan", name)) %>%
  dplyr::filter(! is.na(name)) %>%
  data.table::as.data.table()
usethis::use_data(countries, overwrite = TRUE)


data.json <- rjson::fromJSON(file = "https://datahub.io/core/country-codes/r/country-codes.json")
currencies <- lapply(seq_along(data.json), function(x) parse_json_country_code.fun(data.json[[x]])) %>%
  do.call(what = rbind, args = .) %>%
  dplyr::filter(! is.na(alphabetic)) %>%
  dplyr::group_by(alphabetic) %>%
  dplyr::filter(dplyr::row_number() == 1L) %>%
  dplyr::group_by(alphabetic) %>%
  dplyr::filter(dplyr::row_number() == 1L) %>%
  dplyr::arrange(alphabetic) %>%
  data.table::as.data.table()
usethis::use_data(currencies, overwrite = TRUE)


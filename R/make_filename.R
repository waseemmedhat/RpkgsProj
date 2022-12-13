#' Create a FARS File Name for a Given Year
#'
#' @description To facilitate reading data from FARS files, this function takes
#'   a year to generate the corresponding FARS data file name
#'
#' @param year numeric or character, year to be used in the file name generation
#'
#' @details The function uses \code{\link{sprintf}} to generate the file name,
#'   after coercing the `year` argument to an integer.
#'
#' @return Generated file name as a character
#' @export
#'
#' @seealso \code{\link{fars_read}}
#'
make_filename <- function(year) {
        year <- as.integer(year)
        sprintf("accident_%d.csv.bz2", year)
}

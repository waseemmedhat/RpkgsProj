#' Count Fatal Injuries per Month/Year for Specified Year(s)
#'
#' @param years, vector or list of years
#'
#' @details The function reads the data file(s) for the input years (using
#'   \code{\link{fars_read_years}}) and counts the injuries within each month.
#'
#' @return A tibble with fatal injury count per month/year
#' @export
#'
#' @importFrom dplyr bind_rows group_by summarize n
#' @importFrom tidyr spread
#'
#' @examples
#' fars_summarize_years(2013:2015)
fars_summarize_years <- function(years) {
        dat_list <- fars_read_years(years)
        dplyr::bind_rows(dat_list) |>
                dplyr::group_by(year, MONTH) |>
                dplyr::summarize(n = dplyr::n()) |>
                tidyr::spread(year, n)
}

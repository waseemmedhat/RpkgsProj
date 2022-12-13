#' Get Month/Year of Fatal Injuries for Specified Year(s)
#'
#' @param years, vector or list of years
#'
#' @details The function reads the data file(s) for the input years and returns
#'   the months of fatal injuries. Warnings will be produced for invalid years.
#'
#' @return List of data frames, where each data frame has two columns for month
#'   and year
#' @export
#'
#' @seealso \code{\link{fars_summarize_years}}
#'
#' @importFrom dplyr mutate select
#'
#' @examples
#' fars_read_years(2013:2015)
fars_read_years <- function(years) {
        lapply(years, function(year) {
                file <- make_filename(year)
                tryCatch({
                        dat <- fars_read(file)
                        dplyr::mutate(dat, year = YEAR) |>
                                dplyr::select(MONTH, year)
                }, error = function(e) {
                        warning("invalid year: ", year)
                        return(NULL)
                })
        })
}

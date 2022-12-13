#' Read FARS Data
#'
#' @description The function reads FARS data from the specified file name or
#'   URL.
#'
#' @param filename character, name of file to read data from.
#'
#' @details The function relies on the `readr` function \code{\link{read_csv}}
#'   instead of the base R function. If the file does not exist, the function
#'   throws an error.
#'
#' @return A \code{\link{tibble}} of read data
#' @export
#'
#' @seealso \code{\link{make_filename}} to generate filenames that can be used
#'   by the function.
#'
#' @importFrom readr read_csv
#' @importFrom dplyr tbl_df
#'
#' @examples
#' \dontrun{
#'   fars_read("accident_2013.csv.bz2")
#' }
fars_read <- function(filename) {
        if(!file.exists(filename))
                stop("file '", filename, "' does not exist")
        data <- suppressMessages({
                readr::read_csv(filename, progress = FALSE)
        })
        dplyr::tbl_df(data)
}

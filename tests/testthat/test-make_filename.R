test_that("file names are generated correctly", {
  expect_equal(make_filename(2013), "accident_2013.csv.bz2")
})

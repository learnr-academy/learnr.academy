code <- "x <- 10
x
x + 4
"

outputs <- list()

capture_printed <- function(x) {
  is_vis <- withVisible(x)
  if(is_vis$visible) {
    outputs[[length(outputs) + 1]] <<- is_vis$value
  }
  is_vis$value
}

auto_capture <- function(code) {
  code <- parse(text = code)
  code <- as.expression(lapply(code, function(l) call("capture_printed", l)))
  eval(code)
}

auto_capture(code)

outputs

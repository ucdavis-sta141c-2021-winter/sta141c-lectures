check_out <- function(cart) {
  x <- cart$apple
  y <- cart$banana
  if (is.null(x) || is.null(y)) {
    stop("item should have apple and banana")
  }
  x + y
}


# check_out(list(
#   apple = 1,
#   banana = 2
# ))
#
# check_out(list(
#   apple = 1,
#   orange = 2
# ))
#
# check_out(list(
#   apple_pie = 1,
#   banana = 2
# ))

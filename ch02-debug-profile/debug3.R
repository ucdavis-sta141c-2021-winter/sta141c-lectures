f <- function(x, y = x) {
  if (x < 0) {
    x = -x
  }
  x + y
}

# f(3)
# f(-3)  # it is not 0

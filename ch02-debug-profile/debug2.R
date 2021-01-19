fab_norm <- function(p) {
  x <- c(1, 1, 2, 3, 5, 8)
  (sum(abs(x)^p))^(1/p)
}


# fab_norm(c(1, 2))  # gives wrong result

# possible workaround
# c(fab_norm(1), fab_norm(2))
# map_dbl(c(1,2), fab_norm)

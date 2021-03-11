# module load R
# srun -t 1 -n 4 Rscript 14-calc-pi.R

suppressPackageStartupMessages({
    library(pbdMPI)
})

init()
.comm.size <- comm.size()
.comm.rank <- comm.rank()

m <- runif(10000, -1, 1)
n <- runif(10000, -1, 1)

p <- 4 * sum((m^2 + n^2) < 1) / 10000

x <- reduce(p, op = "sum") / .comm.size

comm.cat("pi is ")
comm.print(x)

### Finish.
finalize()

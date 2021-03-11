# module load R
# srun -p high2 -t 1 -n 4 Rscript 06-reduce.R

suppressPackageStartupMessages({
    library(pbdMPI)
})

init()
.comm.size <- comm.size()
.comm.rank <- comm.rank()

### Examples.
x <- .comm.rank + 1
comm.cat("x =", x, "\n", rank.print = 0)

y <- reduce(x, op = "sum", rank.dest = 0)  # only rank 0 receives the sum
comm.cat("y is ", y, "\n", rank.print = 0)

### Finish.
finalize()

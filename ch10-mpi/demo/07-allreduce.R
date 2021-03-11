# module load R
# srun -t 1 -n 4 Rscript 07-allreduce.R

suppressPackageStartupMessages({
    library(pbdMPI)
})

init()
.comm.size <- comm.size()
.comm.rank <- comm.rank()

### Examples.
x <- .comm.rank + 1
comm.cat("x =", x, "\n", all.rank = TRUE)

y <- allreduce(x, op = "sum")  # all ranks receive the sum
comm.cat("y is ", y, "\n", all.rank = TRUE)

### Finish.
finalize()

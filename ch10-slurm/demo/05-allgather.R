# module load R
# srun -t 1 -n 4 Rscript 05-allgather.R

suppressPackageStartupMessages({
    library(pbdMPI)
})

init()
.comm.size <- comm.size()
.comm.rank <- comm.rank()

### Examples.
x <- .comm.rank + 1
comm.cat("x =", x, "\n", all.rank = TRUE)

y <- allgather(x)  # all ranks receive the list of x
comm.print(y, all.rank = TRUE)

### Finish.
finalize()

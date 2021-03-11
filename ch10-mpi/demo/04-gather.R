# module load R
# srun -t 1 -n 4 Rscript 04-gather.R

suppressPackageStartupMessages({
    library(pbdMPI)
})

init()
.comm.size <- comm.size()
.comm.rank <- comm.rank()

### Examples.
x <- .comm.rank + 1
comm.cat("x =", x, "\n", all.rank = TRUE)

y <- gather(x, rank.dest = 0)  # only rank 0 receives a list of x
comm.print(y, all.rank = TRUE)

### Finish.
finalize()

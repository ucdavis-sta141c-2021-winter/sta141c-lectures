# module load R
# srun -p high2 -t 1 -n 4 Rscript 02-bcast.R

suppressPackageStartupMessages({
    library(pbdMPI)
})

init()
.comm.size <- comm.size()
.comm.rank <- comm.rank()

### Examples.
if (.comm.rank == 0) {
    x <- 3.14
} else {
    x <- NULL
}

y <- bcast(x, rank.source = 0)
comm.cat("y = ", y, all.rank = TRUE)

### Finish.
finalize()

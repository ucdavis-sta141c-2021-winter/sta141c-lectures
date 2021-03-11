# module load R
# srun -p high2 -t 1 -n 4 Rscript 03-scatter.R

suppressPackageStartupMessages({
    library(pbdMPI)
})

init()
.comm.size <- comm.size()
.comm.rank <- comm.rank()

### Examples.
if (.comm.rank == 0) {
    x <- replicate(.comm.size, rnorm(10), simplify = FALSE)
} else {
    x <- NULL
}

y <- scatter(x, rank.source = 0)
comm.print(y, all.rank = TRUE)

### Finish.
finalize()

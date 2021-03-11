# module load R
# srun -t 1 -n 4 Rscript 09-isend-and-recv.R

suppressPackageStartupMessages({
    library(pbdMPI)
})

init()
.comm.size <- comm.size()
.comm.rank <- comm.rank()

### Examples.
if (.comm.rank == 0) {
    x <- 3.14
    isend(x, rank.dest = 1)
    isend(x, rank.dest = 2)
    isend(x, rank.dest = 3)
} else {
    x <- recv(rank.source = 0)
}

comm.print(x, all.rank = TRUE)

### Finish.
finalize()

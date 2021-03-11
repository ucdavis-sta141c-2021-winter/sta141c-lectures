# module load R
# srun -p high2 -t 1 -n 4 Rscript 08-send-and-recv.R

suppressPackageStartupMessages({
    library(pbdMPI)
})

init()
.comm.size <- comm.size()
.comm.rank <- comm.rank()

### Examples.
if (.comm.rank == 0) {
    x <- 3.14
    send(x, rank.dest = 1)
    send(x, rank.dest = 2)
    send(x, rank.dest = 3)
} else {
    x <- recv(rank.source = 0)
}

comm.print(x, all.rank = TRUE)

### Finish.
finalize()

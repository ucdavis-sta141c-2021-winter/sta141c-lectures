# module load R
# srun -t 1 -n 4 Rscript 11-pbdLapply-mw.R

suppressPackageStartupMessages({
    library(pbdMPI)
})


init()
.comm.size <- comm.size()
.comm.rank <- comm.rank()


if (.comm.rank == 0) {
    # only the rank 0 needs the data
    x <- as.list(1:10)
} else {
    x <- NULL
}

# the result is gathered in rank 0
y <- pbdLapply(x, function(x) x^2, pbd.mode = "mw")

comm.print(y)

### Finish.
finalize()

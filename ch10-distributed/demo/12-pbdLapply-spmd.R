# module load R
# srun -p high2 -t 1 -n 4 Rscript 12-pbdLapply-spmd.R

suppressPackageStartupMessages({
    library(pbdMPI)
})


init()
.comm.size <- comm.size()
.comm.rank <- comm.rank()

x <- 1:10  # the same x needs to exist in all ranks
# the result of y is not gathered
y <- pbdLapply(x, function(x) x^2, pbd.mode = "spmd")
comm.print(y, all.rank = TRUE)

### Finish.
finalize()

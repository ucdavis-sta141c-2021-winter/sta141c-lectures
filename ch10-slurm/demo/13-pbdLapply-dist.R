# module load R
# srun -t 1 -n 4 Rscript 13-pbdLapply-dist.R

suppressPackageStartupMessages({
    library(pbdMPI)
})


init()
.comm.size <- comm.size()
.comm.rank <- comm.rank()

# different process gets different x
x <- sample(10, 3)

# the result of y is not gathered
y <- pbdLapply(x, function(x) x^2, pbd.mode = "dist")

comm.print(y, all.rank = TRUE)

### Finish.
finalize()

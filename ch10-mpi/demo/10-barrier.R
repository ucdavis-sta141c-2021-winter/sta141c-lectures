# module load R
# srun -t 1 -n 4 Rscript 10-barrier.R

suppressPackageStartupMessages({
    library(pbdMPI)
})

comm.print("starting huge computation...")

if (comm.rank() == 0) {
    Sys.sleep(5)
}

barrier()  # wait for all processors

cat("rank", comm.rank(), ": ok\n")

finalize()

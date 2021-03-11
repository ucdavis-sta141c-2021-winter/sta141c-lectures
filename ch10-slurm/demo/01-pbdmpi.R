# module load R
# srun -t 1 -n 4 Rscript 01-pbdmpi.R

suppressPackageStartupMessages({
    library(pbdMPI)
})
init()
myRank <- comm.rank()  # who am i?
comm.cat(
    "I am rank", myRank, "from", Sys.info()[["nodename"]], "\n", all.rank = TRUE)
finalize()

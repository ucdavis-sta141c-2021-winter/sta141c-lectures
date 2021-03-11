# We don't need pbdMPI
# because each task is run indepenently
library(tidyverse)

task <- Sys.getenv("SLURM_ARRAY_TASK_ID")

x <- mean(rnorm(100))

write_csv(tibble(x = x), str_c("x", task, ".txt"))

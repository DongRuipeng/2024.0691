require(foreach)
require(doParallel)

platform.path <- "~/2024.0691/"
source.path <- "~/2024.0691/scripts/"
result.path <-
  paste0(platform.path, "result/sim-table-", Sys.Date(), "/")
dir.create(platform.path, showWarnings = FALSE, recursive = TRUE)
dir.create(result.path, showWarnings = FALSE, recursive = TRUE)
source(paste0(source.path, "sim-functions.R"))

z1 <- file(paste0(result.path, "message.Rout"), open = "wt")
sink(z1, type = "message")
z2 <- file(paste0(result.path, "output.Rout"), open = "wt")
sink(z2, type = "output", split = TRUE)

# simulation settings
d <- c(10, 15, 20)
n <- q <- 100
snr <- 0.5
p.list <- c(400, 600, 800)
corrE.list <- c("AR", "SC")

# functions list for simulations
func.list <- c('est.err', 'frate', 'pred.err', 'sim.table')
pkg.list <- c('cospa', 'rrpack', 'secure')

table <- data.frame()

# repetition and number of cores
repetition <- 200
cl.num <- 30
cl <- makeCluster(cl.num)
registerDoParallel(cl)

for (corrE in corrE.list) {
  time.corrE <- Sys.time()
  for (p in p.list) {
    time.p <- Sys.time()
    cat("p = ", p, " begin... \n", sep = "")
    temp.table <-
      foreach(
        i = 1:repetition,
        .combine = 'rbind',
        .packages = pkg.list,
        .export = func.list
      ) %dopar% {
        set.seed(i)
        sim.table(
          n = n,
          p = p,
          q = q,
          snr = snr,
          corrE = corrE,
          d = d
        )
      }
    temp <-
      cbind(temp.table, data.frame(snr = rep(snr, nrow(temp.table)), p = rep(p, nrow(temp.table))))
    table <- rbind(table, temp)
    cat("finished with ",
        difftime(Sys.time(), time.p, units = "mins"),
        " mins",
        ".\n")
  }
  cat(rep("-", 66), "\n", sep = "")
  cat(
    "type-",
    corrE,
    " finished with ",
    difftime(Sys.time(), time.corrE, units = "mins"),
    " mins",
    ".\n"
  )
  filename <- paste0(result.path, "table-", corrE, ".RData")
  save(table, file = filename)
}

sink(type = "message")
close(z1)
sink(type = "output")
close(z2)

# end parallel computing
stopImplicitCluster()
stopCluster(cl)

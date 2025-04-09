rm(list = ls())
cat('\f')


path <- "~/2024.0691/scripts"
out.path <- "~/2024.0691/scripts/result/"
setwd(path)
file <- "table-real-screening"
load(paste0(path, file, ".RData"))
sink(paste0(out.path, file, ".tex"))

table$Time <- as.double(table$Time)

performance <- colnames(table)[1:6]

cat("\\begin{tabular}{l", rep("c", length(performance) + 1), "} \n", sep = "")
cat("\\toprule \n")

cat("Method & $\\norm{\\wh{\\bU}}_{2,0}$",
 " & $\\norm{\\wh{\\bV}}_{2,0}$ & MSE & Prediction & Rank & Time (s) \\\\ \n", sep = "")

cat("\\midrule \n ", sep = "")

for (method in unique(table$method)) {
  cat(method, " & ", sep = "")
  ind <- table$method == method

  ave <- std <- data.frame()

  temp <- table[ind, 1:length(performance)]
  ave <- apply(temp, 2, mean)
  std <- apply(temp, 2, sd)

  ave <- round(ave, 2)
  std <- round(std, 2)

  for (i in 1:length(ave)) {
    cat(ave[i], " (", std[i], ")", sep = "")
    if (i != length(ave)) {
      cat(" & ")
    }
    else {
      cat(" \\\\ \n")
    }
  }
}

cat("\\bottomrule \n")
cat("\\end{tabular} \n")

sink()
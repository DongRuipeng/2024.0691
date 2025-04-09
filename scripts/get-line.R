rm(list = ls())
cat('\f')
require(ggplot2)
require(egg)

path <- "d:/2024.0691/scripts/"
setwd(path)
result.path <- "../results/figures/"
dir.create(result.path, showWarnings = FALSE, recursive = TRUE)

# vary n
file <- "time-n"
load(paste0(path, file, ".RData"))
n.list <- unique(table$n)
mean.table <- data.frame()
for (n in n.list) {
  tmp <- mean(table[n == table$n,]$Time)
  mean.table <- rbind(mean.table, data.frame(Time = tmp, n = n))
}
plot.n <- ggplot(mean.table, aes(x = n, y = Time)) +
  geom_line() +
  geom_point(
    shape = 22,
    color = "black",
    fill = "blue",
    size = 3
  ) +
  ylim(c(0, 3)) + ylab("Time (secs)")

# vary p
file <- "time-p"
load(paste0(path, file, ".RData"))
p.list <- unique(table$p)
mean.table <- data.frame()
for (p in p.list) {
  tmp <- mean(table[p == table$p, ]$Time)
  mean.table <- rbind(mean.table, data.frame(Time = tmp, p = p))
}
plot.p <- ggplot(mean.table, aes(x = p, y = Time)) +
  geom_line() +
  geom_point(
    shape = 22,
    color = "black",
    fill = "blue",
    size = 3
  ) +
  ylim(c(0, 3)) + ylab("Time (secs)")

# vary q
file <- "time-q"
load(paste0(path, file, ".RData"))
q.list <- unique(table$q)
mean.table <- data.frame()
for (q in q.list) {
  tmp <- mean(table[q == table$q, ]$Time)
  mean.table <- rbind(mean.table, data.frame(Time = tmp, q = q))
}
plot.q <- ggplot(mean.table, aes(x = q, y = Time)) +
  geom_line() +
  geom_point(
    shape = 22,
    color = "black",
    fill = "blue",
    size = 3
  ) +
  ylim(c(0, 3)) + ylab("Time (secs)")

ggarrange(plot.n, plot.p, plot.q, nrow = 1, ncol = 3)
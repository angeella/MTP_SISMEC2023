require(ggplot2)
require(RColorBrewer)


cols1 <- brewer.pal(4, "Blues")[c(2,4)]
cols2 <- brewer.pal(4, "Reds")[c(4,3)]
cols2 <- c(brewer.pal(4, "Reds")[3], brewer.pal(4, "Greens")[2], brewer.pal(4, "Reds")[2])
cols <- c(cols1, cols2)

# save plots as 5 x 9

m <- 10
m1 <- 4

truth <- c(rep(1,m1), rep(0,(m-m1)))
rej <- c(1,1,1,0,0,0,1,0,1,0)
diff <- 100 + truth - rej



# plot 1

df <- data.frame(x=rep(seq(m), 1),
                 y=rep(3, each=m),
                 value=truth)

df$value <- as.factor(df$value)

ggplot(df, aes(x=x, y=y, fill=value)) +
  geom_tile(color="black") +
  #scale_x_continuous(breaks=seq(0,m,by=2)) +
  scale_x_continuous(breaks=c()) +
  scale_y_continuous(lim=c(0.5,3.5), breaks=c(3), labels=c("truth")) +
  scale_fill_manual(values=cols) +
  theme_minimal(base_size = 20) +
  theme(plot.title = element_text(hjust=0.5)) +
  labs(title="", x="", y="") +
  theme(legend.position="none")



# plot 2

df <- data.frame(x=rep(seq(m), 2),
                 y=rep(c(3,2), each=m),
                 value=c(truth,rej))

df$value <- as.factor(df$value)

ggplot(df, aes(x=x, y=y, fill=value)) +
  geom_tile(color="black") +
  #scale_x_continuous(breaks=seq(0,m,by=2)) +
  scale_x_continuous(breaks=c()) +
  scale_y_continuous(lim=c(0.5,3.5), breaks=c(2,3), labels=c("rej.", "truth")) +
  scale_fill_manual(values=cols) +
  theme_minimal(base_size = 20) +
  theme(plot.title = element_text(hjust=0.5)) +
  labs(title="", x="", y="") +
  theme(legend.position="none")



# plot 3

df <- data.frame(x=rep(seq(m), 3),
                 y=rep(c(3,2,1), each=m),
                 value=c(truth,rej,diff))

df$value <- as.factor(df$value)

df$lab <- ""
df$lab[df$value == 99] <- "type 1"
df$lab[df$value == 101] <- "type 2"

ggplot(df, aes(x=x, y=y, fill=value, label=lab)) +
  geom_tile(color="black") +
  geom_text(color = "black") +
  #scale_x_continuous(breaks=seq(0,m,by=2)) +
  scale_x_continuous(breaks=c()) +
  scale_y_continuous(lim=c(0.5,3.5), breaks=c(1,2,3), labels=c("err.", "rej.", "truth")) +
  scale_fill_manual(values=cols) +
  theme_minimal(base_size = 15) +
  theme(plot.title = element_text(hjust=0.5)) +
  labs(title="", x="", y="") +
  theme(legend.position="none")







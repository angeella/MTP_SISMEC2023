
library(ggplot2)
library(directlabels)

out <- data.frame(pv = c(0.0001, 0.005, 0.018, 0.0185, 0.02, 0.027, 0.05, 0.08, 0.1, 0.15),
           id = seq(10),
           bh = c((seq(10)*0.05)/(10)),
           by = c((seq(10)*0.05)/(sum(unlist(lapply(seq(10), function(x) x/10)))*10)), 
           col = c("black", rep("black", 4), "#af2927", rep("black", 4)))

ggplot(out) +
  geom_point(aes(x = id, y = pv), size = 2, col = out$col) + 
  geom_line(aes(x = id, y = bh), linewidth = 1, col = "#af2927") + 
 # geom_line(aes(x = id, y = by), linewidth = 1, col = "blue") +
  ylab(expression(p[(i)])) + xlab(paste0("rank of ",expression(p), "-value"))+
  scale_x_continuous(breaks=seq(1,10,1))+
  theme_classic(base_size = 20)+ 
  theme(axis.text.x = element_text(colour = out$col)) +
  geom_text(mapping=aes(x=11, y=0.01, 
                                    label="BY"), hjust = 1, 
            col="blue") + 
  geom_text(mapping=aes(x=11, y=0.05, 
                        label="BH"), hjust = 1, 
            col="#af2927") 


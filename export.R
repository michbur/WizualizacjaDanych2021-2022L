library(ggplot2)
library(dplyr)

dat <- read.csv("./data/polish-driver-license.csv") %>% 
  group_by(year, month) %>% 
  summarise(total = sum(count))

p <- ggplot(dat, aes(x = month, y = total)) +
  geom_col() +
  facet_wrap(~ year) +
  scale_x_continuous(breaks = 1L:6*2)

cairo_ps("p1.eps", width = 10, height = 10)
p
dev.off()

# cairo_pdf

library(svglite)

svglite("p1.svg", width = 10, height = 10)
p
dev.off()
# alternatywa svg
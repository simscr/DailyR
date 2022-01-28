
# Testing SITAR -----------------------------------------------------------

# install.packages("sitar")

library(sitar)
library(tidyverse)


ff <- na.omit(berkeley[berkeley$sex == 2 & berkeley$age >= 8 & berkeley$age <= 18, 
                       c('id', 'age', 'height')])


fh1 <- sitar(x = age, y = height, id = id, data = ff, df = 5)
summary(fh1)

par(mar = c(4,4,1,1) + 0.1, cex = 0.8)

mplot(x = age, y = height, id = id, data = ff, col = id, las = 1)

plot(fh1, opt = 'a', col = id, las = 1, xlim = xaxsd(), ylim = yaxsd())

par(mar = c(4,4,1,1) + 0.1, cex = 0.8)

plot(fh1, opt = 'd', las = 1, apv = TRUE)

plot(fh1, opt = 'v', las = 1, apv = TRUE, lty = 2)

par(mar = c(4,4,1,1) + 0.1, cex = 0.8)

plot(fh1, opt = 'u', las = 1, col = 8, lwd = 0.5)

lines(fh1, opt = 'd', lty = 2)

lines(fh1, opt = 'ua', col = 4, subset = id == 310)

lines(fh1, opt = 'ua', col = 2, subset = id == 355)

legend('bottomright', c('id 310', 'mean', 'id 355'), lty = c(1, 2, 1), col = c(4, 1, 2), cex = 0.8, inset=0.04)

pairs(ranef(fh1), labels = c('size', 'timing', 'intensity'), pch=20)

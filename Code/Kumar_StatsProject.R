data <- read.csv("Data/epl_project_data.csv")
attach(data)

mean(ShotsOnTarget)
median(ShotsOnTarget)
sd(ShotsOnTarget)
var(ShotsOnTarget)
fivenum(ShotsOnTarget)
summary(ShotsOnTarget)

mean(Goals)
median(Goals)
sd(Goals)
var(Goals)
fivenum(Goals)
summary(Goals)

cor(ShotsOnTarget, Goals)

tapply(Goals, Venue, mean)
tapply(Goals, Venue, sd)
tapply(ShotsOnTarget, Venue, mean)

fit <- lm(Goals ~ ShotsOnTarget, data = data)

plot(ShotsOnTarget, Goals, main = "Goals vs. Shots on Target", xlab = "Shots on Target", ylab = "Goals Scored")
hist(ShotsOnTarget, main = "Shots on Target", xlab = "Shots on Target", ylab = "Frequency")
boxplot(Goals ~ Venue, main = "Goals by Stadium", xlab = "Stadium", ylab = "Goals Scored")

summary(fit)
confint(fit, level = 0.95)

qqnorm(resid(fit), main = "Normal QQ Plot of Residuals")
qqline(resid(fit))
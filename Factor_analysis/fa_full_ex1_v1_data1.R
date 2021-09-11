### set libraries
install.packages("psych")
install.packages("corrplot")
install.packages("psych")
install.packages("ggplot2")
install.packages("car")

library(psych)
library(corrplot)
library(psych)
library(ggplot2)
library(car)

# Dataset
setwd("D:/research/thesis_papers/Paper_02_streamtemp_model/Factorial_analysis/example1")


ds <- read.csv('data1.csv')
dim(ds)
head(ds)
dat <- ds[ , -1] ## Remove id in Col#1
head(dat)

#install.packages('corrplot')
#library(corrplot)
datamatrix <- cor(dat[,c(-13)])
corrplot(datamatrix, method="number")
corrplot(datamatrix, is.corr=FALSE)

### breaking in predictor and response variables
X <- dat[,-c(13)]
Y <- dat[,13]
head(X)

### Kaiser-Meyer- Olkin criterion
KMO(X)
# Kaisers (1974) suggested cutoff for determining the factorability of the 
# sample data is KMO ≥ 60. The total KMO is 0.83, indicating that, based on 
# this test, we can probably conduct a factor analysis.

### Bartlett’s Test of Sphericity
cortest.bartlett(X)
# Small values (8.84e-290 < 0.05) of the significance level indicate that a 
# factor analysis may be useful with our data.

### Determinant
det(cor(X))
# [1] 0.00183051

### The Number of Factors to Extract
fafitfree <- fa(dat,nfactors = ncol(X), rotate = "none")
n_factors <- length(fafitfree$e.values)
scree     <- data.frame(
  Factor_n =  as.factor(1:n_factors), 
  Eigenvalue = fafitfree$e.values)
ggplot(scree, aes(x = Factor_n, y = Eigenvalue, group = 1)) + 
  geom_point() + geom_line() +
  xlab("Number of factors") +
  ylab("Initial eigenvalue") +
  labs( title = "Scree Plot", 
        subtitle = "(Based on the unreduced correlation matrix)")

parallel <- fa.parallel(X)

### Factorial analysis using 'fa' function
fa.none <- fa(r=X,
              nfactors = 4, 
              # covar = FALSE, SMC = TRUE,
              fm='pa', # type of factor analysis we want to use (“pa” is principal axis factoring)
              max.iter=100, # (50 is the default, but we have changed it to 100
              rotate = 'varimax') # none rotation
print(fa.none)

### Factor analysis using the 'factanal' method
factanal.none <- factanal(X, factors=4, scores = c("regression"), 
                          rotation = "varimax")
print(factanal.none)

### Graph Factor Loading Matrices
fa.diagram(fa.none)


### Get Scores of new Factors
# head(fa.var$scores)
scores <- fa.none$scores
tail(scores, n=10)
head(fa.none$scores)
head(factanal.none$scores)

### Setting the new DB with new score and Y
# Labeling the data
regdata <- cbind(dat['QD'], fa.none$scores)
head(regdata)
#Labeling the data
names(regdata) <- c('QD','F1','F2','F3','F4')
head(regdata)


### Splitting the data to train and test set
#Splitting the data 70:30
#Random number generator, set seed.
set.seed(100)
indices= sample(1:nrow(regdata), 0.7*nrow(regdata))
v=regdata[indices,]
test = regdata[-indices,]
dim(train)
dim(test)

###Regression Model using train data
model.fa.score = lm(formula = QD~., train)
summary(model.fa.score)
# The model equation can be written as: 
# QD = 3.55854 + 0.72846 F1 + 0.28709 F2 + 0.07357 F3 + 0.62655 F4

### Check multicollinearity by using the variance inflation factor (VIF)
# If 2 or more predictor are highly correlated to each other, they do not 
# provide unique or independent information in the regression model.

# If the degree of correlation is high enough between variables, it can cause 
# problems when fitting and interpreting the regression model.
# See: https://www.statology.org/variance-inflation-factor-r/

library(car)
vif(model.fa.score)


### Check prediction of the model in the test dataset
# Model Performance metrics:
pred_test <- predict(model.fa.score, newdata = test, type = 'response')
pred_test

test$QD_Predicted <- pred_test
head(test[c('QD','QD_Predicted')], 10)

### RMSE for predicted values
rmse_pred <- sqrt(mean((test$QD - pred_test)^2))

### RMSE for Training values
sqrt(mean(model.fa.score$residuals^2))




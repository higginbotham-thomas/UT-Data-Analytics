# Find the errors in an R script

#error messges are in red and prevent further execution
#warnings are also red, but it might allow the script to continue
#but a warning might show something that might affect the analysis

#use the iris flower dataset

install.packages('readr')
library(readr) #it was originally library("readr")

IrisDataset <- read.csv("iris.csv") #it was originally read.csv(iris.csv)

#added, checking the attributes
attributes(IrisDataset)

summary(IrisDataset) #it was originally summary(risDataset)

str(IrisDataset) #it was originally str(IrisDatasets)

names(IrisDataset)

#added - Adding a factor version of Species
IrisDataset$Speciesf <- as.factor(IrisDataset$Species)
summary(IrisDataset)

#added - correcting the data frame so the Species column has numeric values
#droping the levels(labels) from the factor, leaving a distinct number for
#each distinct label. Retaining the nonfactorized column for reference.
IrisDataset$Speciesf <- as.numeric(droplevels(IrisDataset[,"Speciesf"]))
summary(IrisDataset)

hist(IrisDataset$Speciesf)

plot(IrisDataset$Sepal.Length) #originally was plot(IrisDataset$Sepal.Length

qqnorm(IrisDataset$Sepal.Length) #originally was qqnorm(IrisDataset)

#Don't do this --- we already made a numeric factor, this just makes everything NA in the column
#IrisDataset$Species <- as.numeric(IrisDataset$Species)

set.seed(123)

trainSize <- round(nrow(IrisDataset)*0.7) #originally trainSize <- round(nrow(IrisDataset) * 0.2)

testSize <- nrow(IrisDataset)-trainSize #originally testSize <- nrow(IrisDataset) - trainSet

trainSize #originally trainSizes
testSize

#need to add in the training size
training_indices <- sample(seq_len(nrow(IrisDataset)),size=trainSize)
trainSet <- IrisDataset[training_indices,]
testSet <- IrisDataset[-training_indices,]

#drop these 3 lines
#set.seed(405)
#trainSet <- IrisDataset[training_indices,]
#testSet <- IrisDataset[-training_indices,]

LinearModel <- lm(Petal.Width~ Petal.Length, trainSet)# orignally LinearModel <- lm(trainSet$Petal.Width ~ testingSet$PetalLength)

summary(LinearModel)

prediction <- predict(LinearModel,testSet) #originally prediction <- predict(LinearModeltestSet)

prediction #originally predictions

#output of predictions
#1         2         6        16        18        20        22        23        34        35        38        39        44        46        47        51        52        53        54        55        56        57 
#0.2204113 0.2204113 0.2666838 0.2358355 0.2204113 0.2358355 0.2358355 0.1587147 0.2204113 0.2358355 0.2204113 0.2049871 0.2512596 0.2204113 0.2512596 0.7294087 0.6985604 0.7602571 0.6214396 0.7139846 0.6985604 0.7294087 
#58        59        60        61        62        63        64        65        66        67        68        69        70        71        72        73        74        75        76        77        78        79 
#0.5134704 0.7139846 0.6060154 0.5443188 0.6522879 0.6214396 0.7294087 0.5597429 0.6831362 0.6985604 0.6368638 0.6985604 0.6060154 0.7448329 0.6214396 0.7602571 0.7294087 0.6677121 0.6831362 0.7448329 0.7756812 0.6985604 
#80        81        82        83        84        85        86        87        88        89        90        91        92        93        94        95        96        97        98        99       100       101 
#0.5443188 0.5905913 0.5751671 0.6060154 0.7911054 0.6985604 0.6985604 0.7294087 0.6831362 0.6368638 0.6214396 0.6831362 0.7139846 0.6214396 0.5134704 0.6522879 0.6522879 0.6522879 0.6677121 0.4671979 0.6368638 0.9299229 
#102       103       104       105       106       107       108       109       110       111       112       113       114       115       116       117       118       119       120       121       122       123 
#0.7911054 0.9144987 0.8682262 0.8990746 1.0224679 0.6985604 0.9761954 0.8990746 0.9453470 0.7911054 0.8219537 0.8528021 0.7756812 0.7911054 0.8219537 0.8528021 1.0378920 1.0687404 0.7756812 0.8836504 0.7602571 1.0378920 
#124       125       126       127       128       129       130       131       132       133       134       135       136       137       138       139       140       141       142       143       144       145 
#0.7602571 0.8836504 0.9299229 0.7448329 0.7602571 0.8682262 0.8990746 0.9453470 0.9916195 0.8682262 0.7911054 0.8682262 0.9453470 0.8682262 0.8528021 0.7448329 0.8373779 0.8682262 0.7911054 0.7911054 0.9144987 0.8836504 
#146       147       148       149       150 
#0.8065296 0.7756812 0.8065296 0.8373779 0.7911054 

trainSet

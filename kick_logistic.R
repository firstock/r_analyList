## ����: ��ǥ�ݾ��� ���� ���� ������Ʈ �������� ����.
## goal is smaller than, state will be fail
###web_need_logistic
file_path <- "D:/github/dataAnal_R_basic/" #��== �п�
setwd(file_path)

## ���� 300��. -> sample web�ΰ� �ƴѰ� ������ ��������
# install.packages("data.table")
library(data.table)
kick <- fread("data/kick201801.csv") 

kick300 <- kick[sample(nrow(kick), size=300, replace=TRUE),]
str(kick300)
#������ read.csv�� �ٽ� �������� error. 129�� �о��

## numeric column only
names(kick300)
names(kick300_num)
kick300_num <- subset(kick300, select=c("deadline","goal","launched"
                                        ,"pledged","state","backers","usd pledged"))

# ���� �����ͼ��̶� merge ����

## state. ������ > 0 or 1. �ٵ� ���ڿ��̴�??
kick300_num$state
kick300_num$state <- gsub('successful',1,kick300_num$state)
kick300_num$state <- gsub('[^1]+',0,kick300_num$state)

head(kick300_num,1)
names(kick300_num)
str(kick300_num)

# Į���� ���� ���ֱ�
names(kick300_num) <- c("deadline","goal","launched","pledged","state","backers","usdpledged")

## �̻�ġ
# error! FUN(newX[, i], ...) : invalid multibyte string, element 64##### �̻�ġ ���� üũ. Į���� cel�� �ִ� ���� ����> ��(i in 1:length(kick300_num)) {print(max(data.frame(chr = apply(kick300_num, 2, nchar)[, i]))) }
# error! deadline�� �� NA�� �о����, goal 9�ڸ� ����? error! filter�� sapply�� �ǹ� ����!. ���� <- sapply(kick300_num$goal, function(x) {Filter(function(y) {nchar(as.character(y)) == 9 }, x) })

# install.packages("lubridate")
# kick300_num$deadline

library(lubridate)
kick300_num$deadline_hms <- ymd_hms(kick300_num$deadline)
kick300_num$launched_hms <- ymd_hms(kick300_num$launched)
# head(kick300_num$deadline)
# head(kick300_num$launched)

## date -> ������ �Ļ����� �����
kick300_num$endY <- year(kick300_num$deadline)
kick300_num$endMon <- month(kick300_num$deadline)
kick300_num$endD <- day(kick300_num$deadline)
kick300_num$endH <- hour(kick300_num$deadline)
kick300_num$endMin <- minute(kick300_num$deadline)
kick300_num$endS <- second(kick300_num$deadline)


kick300_num$initY <- year(kick300_num$launched)
kick300_num$initMon <- month(kick300_num$launched)
kick300_num$initD <- day(kick300_num$launched)
kick300_num$initH <- hour(kick300_num$launched)
kick300_num$initMin <- minute(kick300_num$launched)
kick300_num$initS <- second(kick300_num$deadline)


names(kick300_num)
head(kick300_num,100)
str(kick300_num)
summary(kick300_num)

# rm date
kick300_num <- subset(kick300_num,
                      select=c("goal","pledged","state"
                               ,"backers","usdpledged"
                               ,"endY","endMon","endD"
                               ,"endH","endMin","endS","initY","initMon"
                               ,"initD","initH","initMin","initS"))

# "goal","pledged","state"
# ,"backers","usdpledged","deadline_hms"
# ,"launched_hms","endY","endMon","endD"
# ,"endH","endMin","endS","initY","initMon"
# ,"initD","initH","initMin","initS"

# as.numeric
# ??apply
# apply(kick300_num, dimcode=1, function(x){  as.numeric(x)})
kick300_num$goal <- as.numeric(kick300_num$goal)
kick300_num$pledged <- as.numeric(kick300_num$pledged)
kick300_num$state <- as.numeric(kick300_num$state)
kick300_num$backers <- as.numeric(kick300_num$backers)
kick300_num$usdpledged <- as.numeric(kick300_num$usdpledged)



# install.packages("caret")
# install.packages("corrplot")
# install.packages("FactoMineR")
library(caret)
library(corrplot)
library(FactoMineR)

# �׳� ����
plot(kick300_num$usdpledged, kick300_num$state)
plot(kick300_num$usdpledged)

# error!
# �������. ���Ӻ����� factor�� ������ƽ ȸ�� ���.
# kick300_num$state <- as.factor(kick300_num$state)
str(kick300_num)

# na.omit(kick300_num)

mod <- glm(state~., data=kick300_num)
summary(mod)
plot(mod)

#error !
??cor
cor <- cor(round(kick300_num[,1:17],digit=0))
crpl<- corrplot.mixed(cor,lower="number",upper="color")
# write.csv(crpl,"result/crplllll.csv")


# error!
#����ǥ
# install.packages("stats")
library(stats)
xtabs(formula=state~., data= kick300_num)
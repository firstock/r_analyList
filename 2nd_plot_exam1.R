getwd()
setwd("./dataAnal_R_basic")
jobless <- read.csv("data2nd/jobless_rateAvg_byAge.csv")
                    # ,stringsAsFactors= F)

# ! X����ȴٰ� check.name=F �� ���ָ� $Į�� ������δ� �� �ҷ���
# jobless <- read.csv("data2nd/jobless_rateAvg_byAge.csv", check.names=F)
jobless

# ,stringsAsFactors= F ������ ���� �ڵ� ���� ���� �ȵ� ;
# Error in plot.window(...) ������ ���鸸�� 'xlim'�� ���� �� �ֽ��ϴ�

plot(jobless)




x_year <- jobless$����

y_less_20 <- jobless[,2]
y_less_30 <- jobless[,3]
y_less_40 <- jobless$X40��
y_less_50 <- jobless$X50��
y_less_60 <- jobless$X60���̻�

# �� �ɼ��� �־ _ _ - - _ - �� ���� ����;;
plot(x= x_year , y= y_less_20, col="gray8", ylim=c(0,10), type="o")
lines(x= x_year, y= y_less_30, col="gray28", type="b")
lines(x= x_year, y= y_less_40, col="gray48", type="b")
lines(x= x_year, y= y_less_50, col="gray58", type="b")
lines(x= x_year, y= y_less_60, col="gray68", type="b")

title(main="�Ǿ���", col.main="gray47")
title(xlab="����", ylab="20��_����%")



# ����� �ڵ�+ ÷��
jobless <- read.csv("data2nd/jobless_rateAvg_byAge.csv", check.names = F)
# jobless <- read.csv("data2nd/jobless_rateAvg_byAge.csv")
jobless

names(jobless) #����,20��,..., 60���̻�
length(jobless) #6

#colname <- jobless$���� # check.names= T �⺻�� �϶� ��밡��
colname <- jobless[,1]; colname #2000��, ... 2013��
length(colname) #14

y_20 <- jobless[,2]
y_30 <- jobless[,3]
y_40 <- jobless[,4]
y_50 <- jobless[,5]
y_60 <- jobless[,6]

plot(y_20, ylim=c(0,10), col="mediumpurple4", type="o",axes=F, lwd=2)
# 1 ��, las 1 ���� ���η�/ 2 ���� ���η�
axis(1, at=1:length(colname), label= colname, las= 2)



## ����, �ĺ��� ����
###### barplot
x <- matrix(c(5,4,3,2),2,2); x
barplot(x,beside=T,names=c(5,3), col=c("green","yellow"))

barplot(x,names=c(5,3),col=c("green","yellow"),ylim=c(0,12))

#�߰� ����
par(oma=c(1,0.5,1,0.5))
barplot(x,names=c(5,3),beside=T,col=c("green","yellow"),horiz=F)


#������
x <- matrix(c(5,4,3,2),2,2)
barplot(x,horiz=T,names=c(5,3),col=c("green","yellow"),xlim=c(0,12))


v1 <- c(100,120,140,160,180)
v2 <- c(120,130,150,140,170)
v3 <- c(140,170,120,110,160)
qty <- data.frame(BANANA=v1,CHERRY=v2,ORANGE=v3); qty

barplot(as.matrix(qty),main="Fruit's Sales QTY" 
        ,beside=T,col=rainbow(nrow(qty)),ylim=c(0,400))
legend(14,400,c("MON","TUE","WED","THU","FRI"),cex=0.8,fill=rainbow(nrow(qty)))


###### ����� �ڵ�
head(data)
data
dim(data)
plot(data)
options(encoding = "UTF-8")
v20 <- data[,2]
v30 <- data[,3]
v40 <- data[,4]
v50 <- data[,5]
v60 <- data[,6]
plot(v20, ylim = c(0,12), xlab = "", ylab = "", col = "violet", axes = F, type = "o", lwd = 2)
title(main = "���ɺ� �Ǿ��� ��Ȳ(����:x)", col.main = "blue")
axis(1, at  = 1:14, label = data$����, las = 2)
axis(2, las = 1)
lines(v30, col = "blue", type = "o", lwd = 2)
lines(v40, col = "green", type = "o", lwd = 2)
lines(v50, col = "yellow", type = "o", lwd = 2)
lines(v60, col = "black", type = "o", lwd = 2)

col = gsub("x", "", data[,2:6])

legend(12, 12, c("20��", "30��", "40��", "50��", "60���̻�"), cex = 0.5, col = c("violet", "blue", "green", "yellow", "black"), lty = 1, lwd = 2, bg = "white")
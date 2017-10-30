###决策树算法学习
#清除R工作环境中的全部东西，可写可不写
rm(list=ls())

library(rpart) ##加载rpart包
head(kyphosis)
attach(kyphosis)

###不加复杂系数限制模型
fit=rpart(Kyphosis~Age+Number+Start)
plot(fit,main='不加复杂系数限制')
text(fit)

#加复杂系数限制模型,加了复杂因子可能会剪枝，使决策树更简洁
fit2=rpart(Kyphosis~Age+Number+Start,control=rpart.control(cp = 0.05))
fit3=rpart(Kyphosis~.,data = kyphosis,control = rpart.control(cp = 0.05))
plot(fit2,main='加复杂系数限制')
text(fit2,use.n = TRUE)


###跟做
library(MASS)
library(rpart)
attach(Pima.tr)
summary(Pima.tr)

#CART决策树分析
cart=rpart(type~.,data=Pima.tr,control=rpart.control(cp=0)) #R中的决策树
summary(cart)
plot(cart,main='未剪枝')
text(cart)
  ###剪枝
cart1=prune(cart,cp=0.02)
plot(cart1)
text(cart1)

###测试
pre=predict(cart,Pima.te,type='class')
m=table(type=Pima.te$type,predict=pre)

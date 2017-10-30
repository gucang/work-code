#1、R语言-treemap图-上新当天各类目各颜色的销量统计
library(treemap)
treemap(data,index=c("类目","颜色"),vSize="上新当天销量",vColor="上新当天销量",type="value",palette="RdBu",title="上新当天销量-颜色")

#2、R语言-词云
library(wordcloud2)
wordcloud2(Data, size = 2, color="random-light",shape="diamond",minRotation = -pi/2, maxRotation = -pi/2)  #默认词云

Emotion <-system.file("examples/t.png",package = "wordcloud2")  
wordcloud2(demoFreq, figPath = Emotion, size = 1,color = "random-light") #图片形状词云

letterCloud(demoFreq,word="LOVE",wordSize=2,color="random-light",backgroundColor="snow") #文字形状词云

#3、直通车/钻展花费与加购成本四象限图
data=read.csv("zhizuan.csv",header=T)
attach(data)
name=data[,1] ##名字

zuanxiao=data[,5]
zhitongche=data[,14]
taoke=data[,21]
##钻展
x1=data[,10]
x2=data[,11]
x3=data[,12]
x4=data[,13]
jiagou=data[,9]
avg=mean(jiagou) #计算加购成本均值
avg2=mean(zuanxiao) #计算钻展花费均值

##直通车
z1=data[,18]
z2=data[,19]
z3=data[,20]
jiagou2=data[,17]
avg3=mean(jiagou2)
avg4=mean(zhitongche)

##钻展推广花费与一天ROI关系
plot(zuanxiao,x1,main="钻展推广花费与一天ROI关系",ylab="一天ROI",xlab="费用")
text(zuanxiao,x1,name,cex=0.6,pos=2)

##钻展推广花费与加购成本关系
pdf("myplot.pdf")
plot(zuanxiao,jiagou,main="X月X日-X月X日钻展推广花费与加购成本关系",ylab="加购成本",xlab="费用",pch=20)  #散点图
text(zuanxiao,jiagou,name,cex=1,pos=3)  #点注释,pos为标注在指定坐标点的哪个方向
abline(h=avg,v=avg2,col="red") #辅助线，垂直/水平
dev.off()

##直通车推广花费与加购成本关系
plot(zhitongche,jiagou2,main="X月X日-X月X日直通车推广花费与加购成本关系",ylab="加购成本",xlab="费用",pch=20)
text(zhitongche,jiagou2,name,cex=1,pos=1)
abline(h=avg3,v=avg4,col="red")
dev.off()

#4、新品聚类分析
data=read.csv("0601xinpinjulei.csv",header=T)
newdata=scale(data) #标准化处理
##kmeans方法，分3类
ks=kmeans(newdata,3)
cbind(data,ks$cluster)

###普通方法
d=dist(newdata) #计算距离
hc1=hclust(d,"single")
hc2=hclust(d,"complete")
hc3=hclust(d,"median")
hc4=hclust(d,"average")
par(mfrow=c(2,2))
plot(hc1)
plot(hc2)
plot(hc3)
plot(hc4)

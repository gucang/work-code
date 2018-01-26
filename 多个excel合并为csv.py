#1、命名规则时将多个excel合并为csv，主要for循环  2018/1/26

#-*- encoding:utf-8 -*-
import pandas as pd

##读取
df=[]
for i in range(1,13):
    path = "C:\\Users\\PVer\\Desktop\\下载\\2017\\" + str(i) + ".xls"  ##文件所在路径名
    data_csv=pd.read_excel(path,skiprows=[0,1,2])   ##读取excel，不读取1-3行(根据内容而定)

    ##只要终端为‘所有终端’的行；只要所需要的列；删除含有NA值的列
    data=data_csv[data_csv['终端']=='所有终端'][['二级类目','支付金额','支付买家数']].dropna(axis=1)

    ##添加月份列，并替代原来默认的index
    data['月份']=str(i)+'月'
    df.append(data.set_index('月份'))

###将多个dataframe合并，pd.concat([,,])
result=pd.concat(df)
##保存文件
result.to_csv(r'C:\Users\PVer\Desktop\下载\2017\all.csv',encoding='utf-8')

#2、命名不规则时？

# # -*- coding:utf-8- -*-#
import jieba
import pandas as pd
from collections import Counter
file=open(r'D:\wenjian\\top100.txt','r')  #读入文件
all_data=file.read()  #读取文件
seg_list=list(jieba.cut(all_data))  #jieba.cut
c=Counter(seg_list)
common_c = c.most_common(100)  #出现次数前100的
for i in common_c:
  a=i[0]
  b=i[1]
  print "%s %d" %(a,b)

#仍需要掌握：1、jieba的各个用法  2、服装语料库而不是默认语料库  3、更好地输出，排除  4、用python进行词云制作

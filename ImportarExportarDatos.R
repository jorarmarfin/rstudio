?read.csv()

data1<-read.csv("data1.csv")
data1
data1$compara<-data1$edad>24
write.table(data1,"data_nueva.csv",sep = ";",row.names = FALSE)


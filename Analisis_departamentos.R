#################################################################
#UBIGEO
setwd("~/RStudio")
install.packages("dplyr")
library(dplyr)
data<-read.csv("csv/data.csv")
#head(data)

#rename(data,porcentaje=field_porcentaje_value)
#tipo de data
#class(data)
#cambia nombre cabecera
#colnames(data)[colnames(data)=="field_porcentaje_value"]<-'porcentajes'
#cambia el nombre de manera momentanea
#head(rename(data,porcentaje=porcentajes))
#Agrupando por nid y departamento
grupo1<-group_by(data,nid,departamento)
#?group_by
#?summarise
tabla1<-summarise(grupo1,cantidad=n())
head(tabla1)
data<-mutate(data, 
       porcentaje_calculado = porcentajes/100
)
#head(data)
#unique para evitar duplicados
fase<-unique(data[c(1,9)])
head(fase)
tabla1<-merge(x = tabla1, y = fase, by = "nid", all = TRUE)
rm(tabla1)
head(tabla1)
write.csv(tabla1,"export/tabla1.csv",sep = ";",row.names = FALSE)

#FASE
fase<-read.csv("fase.csv")
head(fase)

tabla2<-merge(tabla1,fase)
head(tabla2)
write.csv(tabla2,"tabla1.csv",sep = ";",row.names = FALSE)


head(tabla1)
grupo2<-group_by(tabla1,departamento)

tabla3<-summarise(grupo2,cnt=n())
write.csv(tabla3,"tabla2.csv",sep=";",row.names = FALSE)

head(tabla3)


ubicacion<-read.csv("csv/data.csv")
resumen1<-read.csv("csv/data.csv")
head(resumen1)
tbl1<-resumen1[c(1,2)]
tbl2<-resumen1[c(1,4)]

resumen2<-table(tbl1,tbl2)
head(resumen2)
rm(resumen2)
#################################################################
install.packages("dplyr")
library(dplyr)
con <- DBI::dbConnect(RM::PostgreSQL(),    
                      host = "88.99.175.121",   
                      port = 3306,   
                      dbname = "postgres",   
                      user = "your_user",   
                      password = "your_password" )













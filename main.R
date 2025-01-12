
library(Rlab)


empid = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)
age = c(30, 37, 45, 32, 50, 60, 35, 32, 34, 43, 32, 30, 43, 48, 50)
gender = c(0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0)
status = c(1, 1, 2, 2, 1, 1, 1, 2, 2, 1, 2, 1, 2, 1, 2)

empinfo = data.frame(empid, age, gender, status)

empinfo$gender = factor(empinfo$gender, labels = c("male", "female"))

empinfo$status = factor(empinfo$status, labels = c("staff", "faculty"))

male=subset(empinfo, empinfo$gender=="male")
female=subset(empinfo, empinfo$gender=="female")

table1 = table(empinfo$gender)
table2 = table(empinfo$status)
table3 = table(empinfo$gender, empinfo$status)

plot(empinfo$age, type = "l", main="Age of Employees", xlab = "empid", ylab = "Age in Years", col="blue")
pie(table1)

barplot(table3.beside=T.xlim=c(1.15),ylim=c(0.5),col=c("blue","red"))

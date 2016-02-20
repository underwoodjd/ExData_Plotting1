#Course Project 1

#examine the file - read in first 10 lines
x <-read.table("household_power_consumption.txt", header = T,nrows=10)
#Examine the structure and attributes
str(x)
attributes(x)
names(x)
lapply(x, class)

# look at Date and Time
x$Date[1:5]
x$Time[1:5]

#read all the data based on the arguments set based on the previous data review:
d_all <- read.table("household_power_consumption.txt",header = T, sep= ";",
                    na.strings = "?", check.names = F, stringsAsFactors = F, 
                    comment.char = "", quote = '\"'
					)
# look at Date and Time again noting that the time has values
d_all$Date[1:5]
d_all$Time[1:5]

#Convert Date to Data based on the date structure observed above
d_all$Date<-as.Date(d_all$Date, "%d/%m/%Y")
d_all$Date[1:5]
#Examine the data types
lapply(d_all, class)


#subset the data based on the date range
d <- subset(d_all, Date >= "2007-02-01" & Date <= "2007-02-02")
#Examine the data
d$Date[1:5]


#Create a DateTime column
d$DT <- paste(d$Date, d$Time)
#examine DT data
str(d)
names(d)
lapply(d, class)
d_all$DT[1:5]


#Convert DateTime
d$DateTime<-strptime(d$DT, "%Y-%m-%d %H:%M:%S")
#examine DateTime data
lapply(d, class)
d$DateTime[1:5]


#remove the full data set
rm(d_all,x)

#Examine the structure and attributes on last time
str(d);
attributes(d)



#plot2.png
plot(d$DateTime,
     d$Global_active_power,
     type='l',
     ylab="Global Active Power (Kilowatts)", 
     xlab="")


import calendar

for month in range(1,13):

	# myCal = calendar.monthcalendar(2018,month)
	myCal=calendar.monthcalendar(2018,month)

	week_1 = myCal[0]
	week_2 = myCal[1]

	if week_1[calendar.MONDAY]:
		audit = week_1[calendar.MONDAY]
	else:
		audit = week_2[calendar.MONDAY]


	print ("%s %d" %(calendar.month_name[month], audit))



import time
import datetime

print "Time in seconds since the epoch: %s" %time.time()
print "Current date and time: " , datetime.datetime.now()
print "Or like this: " ,datetime.datetime.now().strftime("%y-%m-%d-%H-%M")


print "Current year: ", datetime.date.today().strftime("%Y")
print "Month of year: ", datetime.date.today().strftime("%B")
print "Week number of the year: ", datetime.date.today().strftime("%W")
print "Weekday of the week: ", datetime.date.today().strftime("%w")
print "Day of year: ", datetime.date.today().strftime("%j")
print "Day of the month : ", datetime.date.today().strftime("%d")
print "Day of week: ", datetime.date.today().strftime("%A")
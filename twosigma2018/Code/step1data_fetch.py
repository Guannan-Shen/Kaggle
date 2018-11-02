# practice spline model
# reading data at local machine
import matplotlib.pyplot as plt
import pandas as pd

############# setting pd #############
# Set ipython's max row display
pd.set_option('display.max_row', 100)

# Set iPython's max column width to 20
pd.set_option('display.max_columns', 20)

temps = pd.read_csv("~/Documents/Stats/6643Longitudinal/homework/HW5/global_temp_anomalies.csv", names=['year', 'temp'])
# show the head
print(temps.head(5))

# the header, col names
print(temps.columns)

# plot
plt.plot(temps['year'], temps['temp'], 'go')
plt.xlabel('Year')
plt.ylabel('Temperature')
plt.show()

# spline model with canned function

# Bike sharing Demand

Bike sharing systems are a means of renting bicycles and people can rent a bike from one location and return it to a different or same place. 
The process of obtaining membership, rental, and bike return is automated via a network of kiosk locations throughout a city.

## Objective

To predict the number of bicycles that can be rented.
To understand how factors like Daily , hours, holidays and temperature influence the demand of bikes:

### Data Fields in Dataset
Hourly rental data spanning two years and there  are 7 categorical variables and 4 continuous variables
datetime - hourly date + timestamp  
season -  1 = spring, 2 = summer, 3 = fall, 4 = winter 
Holiday - Whether the day is considered a holiday
Working day - whether the day is neither a weekend nor holiday
Weather - 1: Clear, Few clouds, Partly cloudy, Partly cloudy 
          2: Mist + Cloudy, Mist + Broken clouds, Mist + Few clouds, Mist
          3: Light Snow, Light Rain + Thunderstorm + Scattered clouds, Light Rain + Scattered clouds
          4: Heavy Rain + Ice Pallets + Thunderstorm + Mist, Snow + Fog 
Temp - temperature in Celsius
atemp - "feels like" temperature in Celsius
Humidity - relative humidity
Windspeed - wind speed
Casual - Number of non-registered user rentals initiated
Registered - number of registered user rentals initiated
Count - number of total rentals 

###Alogrithm Used

Linear and Time Series used for analyzing the data.
### 
## Authors

Sunil Kumar Rai

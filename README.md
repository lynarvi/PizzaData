# Pizza Delivery Data: Basic Data Frame Manipulation Using "dplyr" Package 

## Description
The pizza delivery data (pizza_delivery.csv) is a simulated data set. The data refers to
an Italian restaurant which offers home delivery of pizza. It contains the orders received
during a period of one month: May 2014. There are three branches of the restaurant.
The pizza delivery is centrally managed: an operator receives a phone call and forwards
the order to the branch which is nearest to the customer’s address. One of the five
drivers (two of whom only work part time at the weekend) delivers the order. The data
set captures the number of pizzas ordered as well as the final bill which may also
include drinks, salads, and pasta dishes. The owner of the business observed an
increased number of complaints, mostly because pizzas arrive too late and too cold. To
improve the service quality of his business, the owner wants to measure (i) the time
from call to delivery and (ii) the pizza temperature at arrival (which can be done with a
special device). Ideally, a pizza arrives within 30 min of the call; if it takes longer than 40
min, then the customers are promised a free bottle of wine (which is not always handed
out though). The temperature of the pizza should be above 65 0C at the time of delivery.

## Packages Installed

- dplyr
**dplyr** is a grammar of data manipulation providing a consistent set of verbs that help you solve the most common data manipulation challenges. These are combined naturally with `group_by()` which allows you to perform any operation "by group".

    install.packages("dplyr")
    
 The goal of **readr** is to provide a fast and friendly way to read rectangular data (like 'csv', 'tsv', and 'fwf'). It is designed to flexibly parse many types of data found in the wild, while still cleanly failing when data unexpectedly changes

After installing the **dplyr** package, you must call its library.

    library("dplyr")

## Accesing pizza data via github
You can access the file thru this url

https://raw.githubusercontent.com/lynarvi/PizzaData/main/pizza_delivery.csv

### Downloading and Importing Pizza Data from Web to R Console
To directly download and import pizza data to R console use the codes below.

    url = https://raw.githubusercontent.com/lynarvi/PizzaData/main/pizza_delivery.csv
    













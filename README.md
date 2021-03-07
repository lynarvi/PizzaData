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

- **dplyr** is a grammar of data manipulation providing a consistent set of verbs that help you solve the most common data manipulation challenges. These are combined naturally with `group_by()` which allows you to perform any operation "by group".

        install.packages("dplyr")
    
 - The goal of **readr** is to provide a fast and friendly way to read rectangular data (like 'csv', 'tsv', and 'fwf'). It is designed to flexibly parse many types of data found in the wild, while still cleanly failing when data unexpectedly changes
 
        install.packages("readr")

After installing the **dplyr** and **readr** packages, you must call its library.

        library("dplyr")
        library("readr")

## Accesing pizza data via github
You can access the file thru this url

https://raw.githubusercontent.com/lynarvi/PizzaData/main/pizza_delivery.csv

### Downloading and Importing Pizza Data from Web to R Console
To directly download and import pizza data to R console use the codes below.

    urlfile = "https://raw.githubusercontent.com/lynarvi/PizzaData/main/pizza_delivery.csv"
    pizza = read_csv(url(urlfile))

## Manipulating the Pizza Dataset 

### dim() and str()
To view the basic characteristics of the dataset we can use `dim()` and `str()` functions.

        dim(pizza)
        [1] 1266   12

        
        str(pizza)
        tibble [1,266 x 12] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
         $ day              : chr [1:1266] "Thursday" "Thursday" "Thursday" "Thursday" ...
         $ date             : chr [1:1266] "01-May-14" "01-May-14" "01-May-14" "01-May-14" ...
         $ time             : num [1:1266] 35.1 25.2 45.6 29.4 30 ...
         $ operator         : chr [1:1266] "Laura" "Melissa" "Melissa" "Melissa" ...
         $ branch           : chr [1:1266] "East" "East" "West" "East" ...
         $ driver           : chr [1:1266] "Bruno" "Salvatore" "Salvatore" "Salvatore" ...
         $ temperature      : num [1:1266] 68.3 71 53.4 70.3 71.5 ...
         $ bill             : num [1:1266] 58.4 26.4 58.1 35.2 38.4 61.8 57.9 35.8 36.6 44.8 ...
         $ pizzas           : num [1:1266] 4 2 3 3 2 4 3 2 2 5 ...
         $ free_wine        : num [1:1266] 0 0 1 0 0 1 1 0 0 0 ...
         $ got_wine         : num [1:1266] 0 0 0 0 0 1 1 0 0 0 ...
         $ discount_customer: num [1:1266] 1 0 0 0 0 0 0 0 0 0 ...
         - attr(*, "spec")=
          .. cols(
          ..   day = col_character(),
          ..   date = col_character(),
          ..   time = col_double(),
          ..   operator = col_character(),
          ..   branch = col_character(),
          ..   driver = col_character(),
          ..   temperature = col_double(),
          ..   bill = col_double(),
          ..   pizzas = col_double(),
          ..   free_wine = col_double(),
          ..   got_wine = col_double(),
          ..   discount_customer = col_double()
          .. )
  

Suppose we wanted to take the first 3 columns only. There are a few ways to do this. We could for example use numerical indices. But we can also use the names directly.

        names(pizza)[1:3]
        [1] "day"  "date" "time"

        select(pizza,day:time)
        # A tibble: 1,266 x 3
        day      date       time
        <chr>    <chr>     <dbl>
        1 Thursday 01-May-14  35.1
        2 Thursday 01-May-14  25.2
        3 Thursday 01-May-14  45.6
        4 Thursday 01-May-14  29.4
        5 Thursday 01-May-14  30.0
        6 Thursday 01-May-14  40.3
        7 Thursday 01-May-14  48.7
        8 Thursday 01-May-14  34.0
        9 Thursday 01-May-14  28.2
        10 Thursday 01-May-14  38.0
        # ... with 1,256 more rows

### select()
You can also omit variables using the `select()` function by using the negative sign. In this case we want to omit the variables **pizzas** upto **discount**.

        subset_omit<-select(pizza, -(pizzas:discount_customer))
        head(subset_omit)
        
        # A tibble: 6 x 8
           day      date       time operator branch driver    temperature  bill
          <chr>    <chr>     <dbl> <chr>    <chr>  <chr>           <dbl> <dbl>
        1 Thursday 01-May-14  35.1 Laura    East   Bruno            68.3  58.4
        2 Thursday 01-May-14  25.2 Melissa  East   Salvatore        71.0  26.4
        3 Thursday 01-May-14  45.6 Melissa  West   Salvatore        53.4  58.1
        4 Thursday 01-May-14  29.4 Melissa  East   Salvatore        70.3  35.2
        5 Thursday 01-May-14  30.0 Melissa  West   Salvatore        71.5  38.4
        6 Thursday 01-May-14  40.3 Melissa  Centre Bruno            60.8  61.8

        tail(subset_omit)
        
        # A tibble: 6 x 8
           day      date       time operator branch driver    temperature  bill
          <chr>    <chr>     <dbl> <chr>    <chr>  <chr>           <dbl> <dbl>
        1 Saturday 31-May-14  42.9 Melissa  Centre Bruno            56.0  49.8
        2 Saturday 31-May-14  38.6 Laura    West   Mario            63.1  46.7
        3 Saturday 31-May-14  33.8 Laura    East   Domenico         56.3  32  
        4 Saturday 31-May-14  33.1 Laura    Centre Luigi            58.0  45.7
        5 Saturday 31-May-14  36.9 Laura    Centre Salvatore        52.8  39  
        6 Saturday 31-May-14  35.7 Melissa  West   Bruno            58.6  42.7
        








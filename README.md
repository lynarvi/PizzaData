
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
        
## arrange()
The `arrange()` function is used to reorder rows of a data frame according to one
of the variables/columns. Reordering rows of a data frame (while preserving
corresponding order of other columns) is normally a pain to do in R. The `arrange()`
function simplifies the process quite a bit.

Suppose we want to arrange the data by time. We will use the codes below.

        pizza.arr = arrange(pizza, time)
        pizza.arr

        # A tibble: 1,266 x 12
           day       date       time operator branch driver    temperature  bill pizzas free_wine got_wine discount_customer
          <chr>     <chr>     <dbl> <chr>    <chr>  <chr>           <dbl> <dbl>  <dbl>     <dbl>    <dbl>             <dbl>
        1 Tuesday   13-May-14  12.3 Melissa  East   Bruno            84.6  11.9      1         0        0                 0
        2 Tuesday   06-May-14  13.3 Melissa  East   Bruno            83.8  10.6      1         0        0                 0
        3 Monday    19-May-14  13.7 Laura    East   Bruno            84.6   9.1      1         0        0                 1
        4 Sunday    18-May-14  15.1 Melissa  East   Domenico         80.2  26.3      1         0        0                 1
        5 Sunday    04-May-14  15.4 Laura    East   Domenico         83.4  24.6      1         0        0                 1
        6 Monday    19-May-14  15.7 Laura    East   Bruno            80.0  15.9      2         0        0                 0
        7 Monday    05-May-14  16.1 Laura    East   Bruno            79.8  28.9      1         0        0                 0
        8 Wednesday 14-May-14  16.6 Laura    West   Mario            80.2  12.7      1         0        0                 0
        9 Friday    02-May-14  16.7 Laura    East   Mario            87.3  10.8      1         0        0                 0
        10 Monday    12-May-14  16.9 Laura    East   Salvatore        69.5  18.6      1         0        0                 0
        # ... with 1,256 more rows

## filter()
The `filter()` function is used to extract subsets of rows from the data frame. This
function is similar to the existing `subset()` function R but is quite a bit faster in past experiences.

 We want to extract the rows of pizza data where the time is **greater than 50 minutes and temperature is less than 65 C.
 
        pizza.filter = filter(pizza, time > 50 & temperature < 65)
        pizza.filter
        
        # A tibble: 5 x 12
           day       date       time operator branch driver temperature  bill pizzas free_wine got_wine discount_customer
           <chr>     <chr>     <dbl> <chr>    <chr>  <chr>        <dbl> <dbl>  <dbl>     <dbl>    <dbl>             <dbl>
        1 Wednesday 07-May-14  52.2 Laura    Centre Mario         64.8  55.9      7         1        1                 0
        2 Friday    09-May-14  51.2 Laura    West   Luigi         57.9  42.3      4         1        1                 0
        3 Sunday    18-May-14  53.1 Laura    West   Bruno         61.8  56.8      2         1        1                 0
        4 Tuesday   27-May-14  52.3 Melissa  Centre Bruno         58.3  42.9      4         1        1                 0
        5 Thursday  29-May-14  51.1 Laura    Centre Mario         53.9  40.5      3         1        1                 0


## summary()
`summary()` function is a generic function used to produce result summaries of the results of various model fitting functions. The function invokes particular methods which depend on the class of the first argument. 

In this case, we want to find the summary of the **time, temperature, bill, pizzas** in pizza data.

        time = summary(pizza$time) 
        temp = summary(pizza$temperature) 
        bill = summary(pizza$bill)
        pizzas = summary(pizza$pizzas)

After getting the summaries of the given variables, we will make a matrix and export it as a **CSV** file.

        matrix = rbind(time,temp,bill,pizzas)
        matrix
       
                 Min.  1st Qu.   Median      Mean  3rd Qu.     Max.
        time   12.26603 30.06115 34.38196 34.229551 38.57702 53.09626
        temp   41.75872 58.24236 62.92666 62.863950 67.22863 87.58242
        bill    9.10000 35.50000 42.90000 42.755924 50.50000 75.00000
        pizzas  1.00000  2.00000  3.00000  3.013428  4.00000 11.00000
        
        write.csv(matrix,"D:/summary.csv")

## quantile()
The generic function `quantile` produces sample quantiles corresponding to the given probabilities. The smallest observation corresponds to a probability of 0 and the largest to a probability of 1.

In this partwe will determine and interpret the 99% quantile for delivery time and temperature.

        #time
        quantile(pizza$time,probs=.99)
             99% 
        48.61677 

        #temperature
        quantile(pizza$temperature,probs=.99)
             99% 
        79.87 
  
The results are 48.62 min for delivery time and 79.87 ◦C for temperature. This means 99 % of the delivery times are less than or equal to 48.62 min and 1 % of deliveries are greater than or equal to 48.62 min. Similarly, only 1 % of pizzas were delivered with a temperature greater than 79.87 ◦C.

 
## table()

`table` uses the cross-classifying factors to build a contingency table of the counts at each combination of factor levels.

To make a new binary variables that describes whether a pizza was hot (>65◦C) and the delivery time was short (<30 min), we will use the codes below

      tempcat <-ifelse(pizza$temperature>65,"(65,100]","(0,65]")
      timecat <-ifelse(pizza$time>30,"(30,100]","(0,30]")  

After making binary variables, we will make a contingency table out of it.

      ctable = table(tempcat,timecat)
      ctable = addmargins(ctable)
      ctable
      
                  timecat
        tempcat    (0,30] (30,100]  Sum
         (0,65]      101      691  792
        (65,100]    213      261  474
         Sum         314      952 1266

We can see that there is a higher proportion of high temperature ((65,100]) in the category of short delivery times ((0,30]).  


######## Contributors to this Document:
- Mae Aranga
- Shannie Marie Paunon
- Kenny Marie Berguia 
- Mary Dhen Azucena
- Krizel JOy Cabaya
- Arvilyn Mellizas




>  library("dplyr")

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

>     library("readr")
> urlfile = "https://raw.githubusercontent.com/lynarvi/PizzaData/main/pizza_delivery.csv"
> pizza = read_csv(url(urlfile))

-- Column specification ----------------------------------------------------------
cols(
  day = col_character(),
  date = col_character(),
  time = col_double(),
  operator = col_character(),
  branch = col_character(),
  driver = col_character(),
  temperature = col_double(),
  bill = col_double(),
  pizzas = col_double(),
  free_wine = col_double(),
  got_wine = col_double(),
  discount_customer = col_double()
)

> 
> 
>  dim(pizza)
[1] 1266   12
> 
> str(pizza)
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
> 
> 
> names(pizza)[1:3]
[1] "day"  "date" "time"
> 
> 
>  subset_omit<-select(pizza, -(pizzas:discount_customer))
>     head(subset_omit)
# A tibble: 6 x 8
  day      date       time operator branch driver    temperature  bill
  <chr>    <chr>     <dbl> <chr>    <chr>  <chr>           <dbl> <dbl>
1 Thursday 01-May-14  35.1 Laura    East   Bruno            68.3  58.4
2 Thursday 01-May-14  25.2 Melissa  East   Salvatore        71.0  26.4
3 Thursday 01-May-14  45.6 Melissa  West   Salvatore        53.4  58.1
4 Thursday 01-May-14  29.4 Melissa  East   Salvatore        70.3  35.2
5 Thursday 01-May-14  30.0 Melissa  West   Salvatore        71.5  38.4
6 Thursday 01-May-14  40.3 Melissa  Centre Bruno            60.8  61.8
> 
> 
> tail(subset_omit)
# A tibble: 6 x 8
  day      date       time operator branch driver    temperature  bill
  <chr>    <chr>     <dbl> <chr>    <chr>  <chr>           <dbl> <dbl>
1 Saturday 31-May-14  42.9 Melissa  Centre Bruno            56.0  49.8
2 Saturday 31-May-14  38.6 Laura    West   Mario            63.1  46.7
3 Saturday 31-May-14  33.8 Laura    East   Domenico         56.3  32  
4 Saturday 31-May-14  33.1 Laura    Centre Luigi            58.0  45.7
5 Saturday 31-May-14  36.9 Laura    Centre Salvatore        52.8  39  
6 Saturday 31-May-14  35.7 Melissa  West   Bruno            58.6  42.7
> 
> 
>  pizza.arr = arrange(pizza, time)
>     pizza.arr
# A tibble: 1,266 x 12
   day   date   time operator branch driver temperature  bill pizzas free_wine
   <chr> <chr> <dbl> <chr>    <chr>  <chr>        <dbl> <dbl>  <dbl>     <dbl>
 1 Tues~ 13-M~  12.3 Melissa  East   Bruno         84.6  11.9      1         0
 2 Tues~ 06-M~  13.3 Melissa  East   Bruno         83.8  10.6      1         0
 3 Mond~ 19-M~  13.7 Laura    East   Bruno         84.6   9.1      1         0
 4 Sund~ 18-M~  15.1 Melissa  East   Domen~        80.2  26.3      1         0
 5 Sund~ 04-M~  15.4 Laura    East   Domen~        83.4  24.6      1         0
 6 Mond~ 19-M~  15.7 Laura    East   Bruno         80.0  15.9      2         0
 7 Mond~ 05-M~  16.1 Laura    East   Bruno         79.8  28.9      1         0
 8 Wedn~ 14-M~  16.6 Laura    West   Mario         80.2  12.7      1         0
 9 Frid~ 02-M~  16.7 Laura    East   Mario         87.3  10.8      1         0
10 Mond~ 12-M~  16.9 Laura    East   Salva~        69.5  18.6      1         0
# ... with 1,256 more rows, and 2 more variables: got_wine <dbl>,
#   discount_customer <dbl>
> 
> 
> pizza.filter = filter(pizza, time > 50 & temperature < 65)
>     pizza.filter
# A tibble: 5 x 12
  day   date   time operator branch driver temperature  bill pizzas free_wine
  <chr> <chr> <dbl> <chr>    <chr>  <chr>        <dbl> <dbl>  <dbl>     <dbl>
1 Wedn~ 07-M~  52.2 Laura    Centre Mario         64.8  55.9      7         1
2 Frid~ 09-M~  51.2 Laura    West   Luigi         57.9  42.3      4         1
3 Sund~ 18-M~  53.1 Laura    West   Bruno         61.8  56.8      2         1
4 Tues~ 27-M~  52.3 Melissa  Centre Bruno         58.3  42.9      4         1
5 Thur~ 29-M~  51.1 Laura    Centre Mario         53.9  40.5      3         1
# ... with 2 more variables: got_wine <dbl>, discount_customer <dbl>
> 
> 
> time = summary(pizza$time) 
>     temp = summary(pizza$temperature) 
>     bill = summary(pizza$bill)
>     pizzas = summary(pizza$pizzas)
> 
> matrix = rbind(time,temp,bill,pizzas)
>     matrix
           Min.  1st Qu.   Median      Mean  3rd Qu.     Max.
time   12.26603 30.06115 34.38196 34.229551 38.57702 53.09626
temp   41.75872 58.24236 62.92666 62.863950 67.22863 87.58242
bill    9.10000 35.50000 42.90000 42.755924 50.50000 75.00000
pizzas  1.00000  2.00000  3.00000  3.013428  4.00000 11.00000
> 
> 
> write.csv(matrix,"D:/summary.csv")
> 
> #time
>     quantile(pizza$time,probs=.99)
     99% 
48.61677 
> 
> 
> #temperature
>     quantile(pizza$temperature,probs=.99)
  99% 
79.87 
> 
>  tempcat <-ifelse(pizza$temperature>65,"(65,100]","(0,65]")
>   timecat <-ifelse(pizza$time>30,"(30,100]","(0,30]")  
>  ctable = table(tempcat,timecat)
>   ctable = addmargins(ctable)
>   ctable
          timecat
tempcat    (0,30] (30,100]  Sum
  (0,65]      101      691  792
  (65,100]    213      261  474
  Sum         314      952 1266
> 

#========================================================
Description paste()

Concatenate vectors after converting to character.

Usage

paste (..., sep = " ", collapse = NULL)
paste0(..., collapse = NULL)
Arguments

...	
one or more R objects, to be converted to character vectors.

sep	
a character string to separate the terms. Not NA_character_.

collapse	
an optional character string to separate the results. Not NA_character_.


Examples

paste(1:12) # same as as.character(1:12)
paste("A", 1:6, sep = "")
stopifnot(identical(paste ("A", 1:6, sep = ""),
		    paste0("A", 1:6)))
paste("Today is", date())

testCheck <- function(a) {

   if (class(a) == "numeric") {
      b <- a + 3
      return(b)
    } else if (class(a) == "character") {
        b <- paste("is character", a, sep=" ")
        return(b)
       } else {print("Its logical")}

}
#========================================================
#Examples
## The intersection of two sets can be defined via match():
## Simple version:
## intersect <- function(x, y) y[match(x, y, nomatch = 0)]
intersect # the R function in base, slightly more careful
intersect(1:10, 7:20)
1:10 %in% c(1,3,5,9)
sstr <- c("c","ab","B","bba","c",NA,"@","bla","a","Ba","%")
sstr[sstr %in% c(letters, LETTERS)]
"%w/o%" <- function(x, y) x[!x %in% y] #--  x without y
(1:10) %w/o% c(3,7,12)
#========================================================
#http://stackoverflow.com/questions/5890576/usage-of-three-dots-or-dot-dot-dot-in-functions
vectorlist <- list(vector.a.1 = c("a", "b", "c"),
                    vector.a.2 = c("a", "b", "d"),
                    vector.b.1 = c("e", "f", "g"))

intersect2 <- function(...) {
   args <- list(...)
   nargs <- length(args)
   if(nargs <= 1) {
     if(nargs == 1 && is.list(args[[1]])) {
       do.call("intersect2", args[[1]])
     } else {
       stop("cannot evaluate intersection fewer than 2 arguments")
     }
   } else if(nargs == 2) {
     intersect(args[[1]], args[[2]])
   } else {
     intersect(args[[1]], intersect2(args[-1]))
   }
}

vector.a <- vectorlist[grep ("vector.a", names(vectorlist))]
intersect2(vector.a)
intersect2(vectorlist)
#========================================================
Details

Each of union, intersect, setdiff and setequal will discard any duplicated values in the arguments, and they apply as.vector to their arguments (and so in particular coerce factors to character vectors).

is.element(x, y) is identical to x %in% y.

Value

A vector of the same mode as x or y for setdiff and intersect, respectively, and of a common mode for union.

A logical scalar for setequal and a logical of the same length as x for is.element.
(x <- c(sort(sample(1:20, 9)), NA))
(y <- c(sort(sample(3:23, 7)), NA))
union(x, y)
intersect(x, y)
setdiff(x, y)
setdiff(y, x)
setequal(x, y)

## True for all possible x & y :
setequal( union(x, y),
          c(setdiff(x, y), intersect(x, y), setdiff(y, x)))

is.element(x, y) # length 10
is.element(y, x) # length  8
#========================================================
Random Permutations
In its simplest form, the sample function can be used to return a
random permutation of a vector. To illustrate this, let’s create a
vector of the integers from 1 to 10 and assign it to a variable x.

x <- 1:10
Now, use sample to create a random permutation of the vector x.

sample(x)
 [1]  3  2  1 10  7  9  4  8  6  5
Note that if you give sample a vector of length 1 (e.g., just the
number 10) that it will do the exact same thing as above, that is,
create a random permutation of the integers from 1 to 10.

sample(10)
 [1] 10  7  4  8  2  6  1  9  5  3
Warning!

This can be a source of confusion if you’re not careful. Consider the
following example from the sample help file.

sample(x[x > 8])
sample(x[x > 9])
[1] 10  9
 [1]  9  3  4  8  1 10  7  5  2  6
Notice how the first output is of length 2, since only two numbers are
greater than eight in our vector. But, because of the fact that only
one number (that is, 10) is greater than nine in our vector, sample
thinks we want a sample of the numbers from 1 to 10, and therefore
returns a vector of length 10.

The replace argument
Often, it is useful to not simply take a random permutation of a
vector, but rather sample independent draws of the same vector. For
instance, we can simulate a Bernoulli trial, the result of the flip of
a fair coin. First, using our previous vector, note that we can tell
sample the size of the sample we want, using the size argument.

sample(x, size = 5)
[1]  2 10  5  1  6
Now, let’s perform our coin-flipping experiment just once.

coin <- c("Heads", "Tails")
sample(coin, size = 1)
[1] "Tails"
And now, let’s try it 100 times.

sample(coin, size = 100)
Error in sample(coin, size = 100) :
  cannot take a sample larger than the population when 'replace = FALSE'
Oops, we can’t take a sample of size 100 from a vector of size 2,
unless we set the replace argument to TRUE.

table(sample(coin, size = 100, replace = TRUE))

Heads Tails
   53    47
Simple bootstrap example
The sample function can be used to perform a simple bootstrap.
Let’s use it to estimate the 95% confidence interval for the mean of a
population. First, generate a random sample from a normal
distribution.

rn <- rnorm(1000, 10)
Then, use sample multiple times using the replicate function to
get our bootstrap resamples. The defining feature of this technique is
that replace = TRUE. We then take the mean of each new sample, gather them, and finally compute the relevant quantiles.

quantile(replicate(1000, mean(sample(rn, replace = TRUE))),
         probs = c(0.025, 0.975))
     2.5%     97.5%
 9.936387 10.062525
Compare this to the standard parametric technique.

t.test(rn)$conf.int
[1]  9.938805 10.061325
attr(,"conf.level")
[1] 0.95
#========================================================
R outer Function

outer() function applies a function to two arrays.

outer(x, y, FUN="*", ...)
x %o% y

x,y: arrays
FUN: function to use on the outer products, default is multiply
... 

>x <- c(1,2.3,2,3,4,8,12,43)
>y<- c(2,4)

Calculate logarithm value of array x elements using array y as bases:
>outer(x,y,"log")
          [,1]      [,2]
 [1,] 0.000000 0.0000000
 [2,] 1.201634 0.6008169
 [3,] 1.000000 0.5000000
 [4,] 1.584963 0.7924813
 [5,] 2.000000 1.0000000
 [6,] 3.000000 1.5000000
 [7,] 3.584963 1.7924813
 [8,] 5.426265 2.7131324

Add array x elements with array y elements:
> outer(x,y,"+")
     [,1] [,2]
[1,]  3.0  5.0
[2,]  4.3  6.3
[3,]  4.0  6.0
[4,]  5.0  7.0
[5,]  6.0  8.0
[6,] 10.0 12.0
[7,] 14.0 16.0
[8,] 45.0 47.0

Multiply array x elements with array y elements:
> x %o% y  #equal to outer(x,y,"*")
     [,1]  [,2]
[1,]  2.0   4.0
[2,]  4.6   9.2
[3,]  4.0   8.0
[4,]  6.0  12.0
[5,]  8.0  16.0
[6,] 16.0  32.0
[7,] 24.0  48.0
[8,] 86.0 172.0

Concatenate characters to the array elements:
>z <- c("a","b")
>outer(x,z,"paste")
      [,1]    [,2]   
 [1,] "1 a"   "1 b"  
 [2,] "2.3 a" "2.3 b"
 [3,] "2 a"   "2 b"  
 [4,] "3 a"   "3 b"  
 [5,] "4 a"   "4 b"  
 [6,] "8 a"   "8 b"  
 [7,] "12 a"  "12 b" 
 [8,] "43 a"  "43 b" 
#========================================================
> tab
       a   b    c    d
val1 210 201 2001 2020
val2 302 200 2919 3030
val3 839 939 8383 8383

> tab2
       e   f
val1 2.3 3.4
val2 3.4 8.3
val3 7.3 8.3

> t(sapply(intersect(rownames(tab), rownames(tab2)), 
      function(x) outer(as.matrix(tab[x, ]), as.matrix(tab2[x, ])))
    )

       [,1]   [,2]    [,3]    [,4]   [,5]   [,6]    [,7]    [,8]
val1  483.0  462.3  4602.3  4646.0  714.0  683.4  6803.4  6868.0
val2 1026.8  680.0  9924.6 10302.0 2506.6 1660.0 24227.7 25149.0
val3 6124.7 6854.7 61195.9 61195.9 6963.7 7793.7 69578.9 69578.9

#To assign column names based on the column names of the original set, use outer again on the names, this time passing to paste. This ensures that the same order is used for the name computation as was used for the numeric computation.

colnames(result) <- outer(colnames(tab), colnames(tab2), FUN=paste, sep='*')
result


#http://stackoverflow.com/questions/12042309/compare-two-matrices-with-criteria-in-r?rq=1
#http://stackoverflow.com/questions/9316946/comparing-rows-between-two-matrices?rq=1
#http://stackoverflow.com/questions/21653926/r-finding-rows-of-one-matrix-in-another-matrix?rq=1





#make a new table with the cell count and different probe normalization and calculate for individual probes. Need to create two functions. One which takes the two tables with cell count data enveloping a function for calculating multiple linear regression taking indidual rows from two tables, making a new table along with cells data and the performing regression and returning theta values/reression equation.

#take transpose of two tables

#cell count data

#created a list having different data frames for individual probes. Now just put each member of the list to a lm() function and returned theta values must be put in the equation and multiply and get the actual cell count.

#finally return a data.frame with probe names and cell counts


calCellCount <- function(probe, columns, cells, probeList, intValues) {

     predictValues <- cbind(probeList, intValues)
     matrixModels <- getFitCoefs(probe, columns, cells)

}




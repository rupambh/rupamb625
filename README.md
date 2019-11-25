# rupamb625
[![Build Status](https://img.shields.io/travis/rupambh/rupamb625/master.svg)](https://travis-ci.org/rupambh/rupamb625) [![codecov](https://codecov.io/github/rupambh/rupamb625/branch/master/graphs/badge.svg)](https://codecov.io/github/rupambh/rupamb625) 

Hi! Welcome to our package for combining p-values from multiple experiments or multiple hypotheses testing problems. This package offers implementations of four different p-value aggregation methods in R, namely, the Fisher, Lancaster, Stouffer and Sidak methods. For more details on the methods and references, you can visit the individual help pages for the functions by calling something like the following on your R console.

```R
?fisher
```

As usual, the [/R](https://github.com/rupambh/rupamb625/tree/master/R) folder contains the R codes, the [/man](https://github.com/rupambh/rupamb625/tree/master/man) folder contains the sources for the help pages, generated automatically using [roxygen2](https://cran.r-project.org/web/packages/roxygen2), and the [/tests](https://github.com/rupambh/rupamb625/tree/master/tests) folder contains the test files set up using the [uesthis::use_testthat](https://www.rdocumentation.org/packages/usethis/versions/1.5.1/topics/use_testthat) function.

If you want to check the package using more test cases, add them locally to the .R files in [/tests/testthat](https://github.com/rupambh/rupamb625/tree/master/tests/testthat) following the format of the tests already included and then use [devtools::test()](https://www.rdocumentation.org/packages/devtools/versions/2.2.1/topics/test).

To install the latest version of the package, run the following on your R console.

```R
devtools::install_github("rupambh/rupamb625",build_vignettes=TRUE)
```

We offer a short tutorial including example usages of each of the functions, verifications of correctness of the results and comparisons of performance against functions from the [aggregation](https://cran.r-project.org/web/packages/aggregation/index.html) and [metap](https://cran.r-project.org/web/packages/metap/index.html) packages available on CRAN. The tutorial can be accessed by typing the following on R once you have the package installed (make sure you include the *build_vignettes=TRUE* statement while installing).

```R
browseVignettes("rupamb625")
```

If you have any further comments/queries, let us know [here](mailto:rupamb@umich.edu)!

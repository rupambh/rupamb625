
#' Fisher's Method for Aggregating p-values
#'
#' Aggregate a given set of p-values with equal weights. This is equivalent to using Lancaster's Method with all p-values weighted by 2.
#'
#' @author Rupam Bhattacharyya, \email{rupamb@@umich.edu}
#'
#' @param pvalues A vector of p-values to be aggregated using Fisher's Method. NAs and values outside the interval [0,1] will be removed.
#' @return A single scalar aggregated p-value (between 0 and 1).
#' @examples
#' fisher(c(.1, .2, .3))
#'
#' @references Fisher, R. A. (1992). Statistical methods for research workers. In \emph{Breakthroughs in statistics} (pp. 66-70). Springer, New York, NY.
#' @seealso \code{\link{lancaster}}, \code{\link{stouffer}}, \code{\link{sidak}}
#'
#' @importFrom stats pchisq
#' @export
fisher=function(pvalues)
{
	# Remove NA and invalid values

  pvalues=pvalues[is.na(pvalues)==FALSE&pvalues>=0&pvalues<=1]

  # Set return value and pointer

  output=NULL

  # Checking for trivial cases

  if(length(pvalues)==0)
	{
		# Blank input

    output=NA
	}

  else if(length(pvalues)==1)
  {
    # Single input

    output=pvalues
  }

  else
  {
    # Compute aggregated chi-square statistic and degrees of freedom

    df=2*length(pvalues)
    teststat=-2*sum(log(pvalues))

    # Compute aggregated p-value

    output=pchisq(teststat,df,lower.tail=FALSE)
  }

  # Return aggregated p-value

  return(output)
}

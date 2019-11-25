
#' Lancaster's Method for Aggregating p-values
#'
#' Aggregate a set of p-values with user-specified weights.
#'
#' @author Rupam Bhattacharyya, \email{rupamb@@umich.edu}
#'
#' @param pvalues A vector of p-values to be aggregated using Lancaster's Method. NAs and values outside the interval [0,1] will be removed along with the corresponding weights.
#' @param weights A vector of weights, each corrsponding to its respective p-value, provided in the same order. Note that therefore, the length of the weights vector must be the same as that of the pvalues vector, and that weights must be nonegative. NAs and negative weights will be filtered out along with associated p-values.
#' @return A single scalar aggregated p-value (between 0 and 1).
#' @examples
#' lancaster(c(.1, .5), c(2, 4))
#'
#' @references Lancaster, H. O. (1961). The combination of probabilities: an application of orthonormal functions. \emph{Australian Journal of Statistics}, 3(1), 20-33.
#' @seealso \code{\link{fisher}}, \code{\link{stouffer}}, \code{\link{sidak}}
#'
#' @importFrom stats pchisq qgamma
#' @export
lancaster=function(pvalues,weights)
{
  # Remove pairs with NA and invalid p-values

  weights=weights[is.na(pvalues)==FALSE&pvalues>=0&pvalues<=1]
  pvalues=pvalues[is.na(pvalues)==FALSE&pvalues>=0&pvalues<=1]

	# Remove pairs with NA or negative weights

  pvalues=pvalues[is.na(weights)==FALSE&weights>0]
  weights=weights[is.na(weights)==FALSE&weights>0]

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

    df=sum(weights)
    teststat=sum(sapply(1:length(pvalues),function(i){qgamma(pvalues[i],shape=weights[i]/2,scale=2,lower.tail=FALSE)}))

    # Compute aggregated p-value

    output=pchisq(teststat,df,lower.tail=FALSE)
  }

  # Return aggregated p-value

  return(output)
}

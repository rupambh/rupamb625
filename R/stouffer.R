
#' Stouffer's Method for Aggregating p-values
#'
#' Aggregate a set of one-sided p-values by using standard normal transformations.
#'
#' @author Rupam Bhattacharyya, \email{rupamb@@umich.edu}
#'
#' @param pvalues A vector of p-values to be aggregated using Stouffer's Method. NAs and values outside the interval [0,1] will be removed.
#' @return A single scalar aggregated p-value (between 0 and 1).
#' @examples
#' stouffer(c(.05, .2, .5))
#'
#' @references Stouffer, S. A., Suchman, E. A., DeVinney, L. C., Star, S. A., & Williams Jr, R. M. (1949). The american soldier: Adjustment during army life.(studies in social psychology in world war ii), vol. 1.
#' @seealso \code{\link{lancaster}}, \code{\link{stouffer}}, \code{\link{sidak}}
#'
#' @importFrom stats pnorm qnorm
#' @export
stouffer=function(pvalues)
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
        # Compute aggregated p-value

        output=pnorm(sum(qnorm(pvalues))/sqrt(length(pvalues)))
    }

    # Return aggregated p-value

    return(output)
}

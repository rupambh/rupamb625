
#' Sidak's Method for Aggregating p-values
#'
#' Aggregate a set of p-values by adjusting the minimum p-value w.r.t. the number of p-values being adjusted.
#'
#' @author Rupam Bhattacharyya, \email{rupamb@@umich.edu}
#'
#' @param pvalues A vector of p-values to be aggregated using Sidak's Method. NAs and values outside the interval [0,1] will be removed.
#' @return A single scalar aggregated p-value (between 0 and 1).
#' @examples
#' sidak(c(.1, .2, .3))
#'
#' @references Šidák, Z. (1967). Rectangular confidence regions for the means of multivariate normal distributions. \emph{Journal of the American Statistical Association}, 62(318), 626-633.
#' @seealso \code{\link{lancaster}}, \code{\link{stouffer}}, \code{\link{sidak}}
#'
#' @export
sidak=function(pvalues)
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

        output=1-(1-min(pvalues))^length(pvalues)
    }

    # Return aggregated p-value

    return(output)
}

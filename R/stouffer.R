
#' Stouffer's Method for Aggregating p-values
#'
#' Aggregate a set of one-sided p-values by using standard normal transformations.
#' @param pvalues A vector of p-values to be aggregated using Stouffer's Method. NAs and values outside the interval [0,1] will be removed.
#' @examples
#' stouffer(c(.05, .2, .5))
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

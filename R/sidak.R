
#' Sidak's Method for Aggregating p-values
#'
#' Aggregate a set of p-values by adjusting the minimum p-value w.r.t. the number of p-values being adjusted.
#' @param pvalues A vector of p-values to be aggregated using Sidak's Method. NAs and values outside the interval [0,1] will be removed.
#' @examples
#' sidak(c(.1, .2, .3))
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

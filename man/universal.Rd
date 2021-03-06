% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/universal.R
\name{universal}
\alias{universal}
\title{Compute universal threshold backbone}
\usage{
universal(M, upper = NULL, lower = NULL, bipartite = NULL, narrative = FALSE)
}
\arguments{
\item{M}{graph: Bipartite graph object of class matrix, sparse matrix, igraph, edgelist, or network object.}

\item{upper}{Real, FUN, or NULL: upper threshold value or function to be applied to the edge weights. Default is NULL.}

\item{lower}{Real, FUN, or NULL: lower threshold value or function to be applied to the edge weights. Default is NULL.}

\item{bipartite}{Boolean: TRUE if bipartite matrix, FALSE if weighted matrix. Default is NULL.}

\item{narrative}{Boolean: TRUE if suggested text for a manuscript is to be returned}
}
\value{
backbone, a list(backbone, summary). The `backbone` object is a graph object of the same class as M.
    The `summary` contains a data frame summary of the inputted matrix and the model used including:
    model name, number of rows, skew of row sums, number of columns, skew of column sums, and running time.
}
\description{
`universal` returns a backbone graph in which edge weights are set to
   1 if above the given upper parameter threshold,
   set to -1 if below the given lower parameter threshold, and are 0 otherwise.
}
\details{
If both `upper` and `lower` are `NULL`, a weighted projection is returned.

If `bipartite` is `NULL`, the function tries to guess at whether the data is bipartite or unipartite based on its shape.
}
\examples{
test <- universal(davis\%*\%t(davis), upper = function(x)mean(x)+sd(x), lower=function(x)mean(x))
test2 <- universal(davis, upper = function(x)mean(x)+2*sd(x), lower = 2, bipartite = TRUE)
test3 <- universal(davis, upper = 4, lower = 2, bipartite = TRUE)
}

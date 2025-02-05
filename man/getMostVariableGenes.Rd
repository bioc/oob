% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/markers_diffExpr.R
\name{getMostVariableGenes}
\alias{getMostVariableGenes}
\title{Compute over dispersion values for each gene.}
\usage{
getMostVariableGenes(
  data,
  minCount = 0.01,
  plot = TRUE,
  returnPlot = FALSE,
  sce_assay = 1
)
}
\arguments{
\item{data}{Normalized count table with genes as rows.
Can also be a \code{SummarizedExperiment} or \code{SingleCellExperiment} object.}

\item{minCount}{Minimum average expression to not be filtered out.}

\item{plot}{Logical. Show the overdispersion plot.}

\item{returnPlot}{Logical, if \code{plot} return it as a ggplot object instead of
printing it.}

\item{sce_assay}{Integer or character, if \code{data} is a
\code{SummarizedExperiment} related object, the assay name to use.}
}
\value{
A ggplot graph if \code{returnPlot}, otherwise a dataframe with the
following columns:
\itemize{
\item mu: average expression
\item var: variance
\item cv2: squared coefficient of variation. Used as a dispersion value.
\item residuals: y-distance from teh regression. Can be used as an
overdispersion value.
\item residuals2: squared residuals
\item fitted: theoretical dispersion for the gene average (y value of the curve).

If \code{data} is a \code{SummarizedExperiment} related object
the function will add the gene metrics to \code{rowData}.
}
}
\description{
Compute over dispersion values for each gene.
}
\examples{
data("bulkLogCounts")
normCount<-2^(bulkLogCounts-1)
dispData<-getMostVariableGenes(normCount,minCount=1)
library(SingleCellExperiment)
sce <- SingleCellExperiment(assays = list(counts = normCount))
sce <- getMostVariableGenes(sce,minCount=1)
rowData(sce) |> chead()
}

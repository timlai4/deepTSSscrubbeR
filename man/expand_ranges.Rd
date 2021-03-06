% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/expand_ranges.R
\name{expand_ranges}
\alias{expand_ranges}
\title{Expand Ranges}
\usage{
expand_ranges(
  deep_obj,
  sequence_expansion = 10,
  signal_expansion = 10,
  shape_expansion = 10
)
}
\arguments{
\item{deep_obj}{deep_tss object}

\item{sequence_expansion}{Number of bases to expand on each side for surrounding sequence analysis}

\item{signal_expansion}{Number of bases to expand on each side for surrounding signal analysis}

\item{shape_expansion}{Number of bases to expand on each side for surrounding DNA shape analysis}
}
\value{
Expanded GRanges objects
}
\description{
Expand TSS GRanges for downstream analysis
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lag_window.R
\name{lag_windows}
\alias{lag_windows}
\title{Collects and embeds lagged windows of data as a vector.}
\usage{
lag_windows(x, p = 0, P = 0, freq = 1, shift = 0, no_peeking = TRUE,
  pstr = deparse(substitute(x)))
}
\arguments{
\item{x}{data input (can handle multi-column data, such as data.frames)}

\item{p}{window length}

\item{P}{seasonal window length}

\item{freq}{seasonal period}

\item{shift}{if the time-series is to be shifted}

\item{no_peeking}{if TRUE, lags <= 0 (from now and future) are removed}

\item{pstr}{name of datacolumn}
}
\value{
a matrix of lagged windows
}
\description{
Order \code{p} determines size of the recent lags,
and \code{P} and \code{freq} can be used to create seasonal lags.
}
\seealso{
\code{\link{centered_lagged_windows}}, \code{\link{seasonal_lag_windows}}
}


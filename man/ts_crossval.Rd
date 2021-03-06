% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/crossval.R
\name{ts_crossval}
\alias{ts_crossval}
\title{Time-series cross-validation}
\usage{
ts_crossval(y, func, ..., initial_window, horizon = 1, fixed_window = TRUE,
  skip_slice = 0, slices = create_cv_timeslices(y, initial_window =
  initial_window, horizon = horizon, fixed_window = fixed_window, skip =
  skip_slice), error_func = rmse, break_err = Inf, break_err_batch = Inf,
  break_batch_size = NA, plapply = NULL, verbose = FALSE)
}
\arguments{
\item{y}{The time-series}

\item{func}{Forecasting function. See details.}

\item{...}{Forcasting function parameters.}

\item{initial_window}{initial number of consecutive values in each training set sample}

\item{horizon}{forecat horizon in cross-validation. Number of consecutive values in test set sample}

\item{fixed_window}{if TRUE, training window size is fixed to \code{initial_window}.
If \code{FALSE}, all available data from the start until testing point is used.}

\item{skip_slice}{How many slices are to be skip_sliceped and not used for cross-validation.}

\item{slices}{Cross-validation slices}

\item{error_func}{Error function for reporting cross-validation error.}

\item{break_err}{If CV error exceeds this value, cross-validation is prematurely stopped. See details.}

\item{break_err_batch}{If CV error in each batch exceeds this value, cross-validation is prematurely stopped. See details.}

\item{break_batch_size}{Batch size for \code{break_err_batch} and \code{plapply}. See details}

\item{plapply}{Parallel processing apply function for each batch. \code{lapply} by default. See details.}

\item{verbose}{If True, verbose debugging messages are printed out.}
}
\value{
Cross-validation error for the given forecast function
}
\description{
Time-series cross-validation
}
\details{
\code{func} expects function signature \code{function(y, h, ...)}, where \code{y} is the time-series to forecast,
\code{h} is the horizon to forecast, and \code{...} is any other parameter.

\code{error_func} expects function signature \code{function(x, y)}, where \code{x} and \code{y} are both
time-series. It should return a number, which must be accumulative.

Use \code{break_err} when you have to evaluate many functions quickly.
By setting this value to CV from a known good predictor, bad forecasters can be pruned quickly.
This value is only effective is \code{break_batch_size} is given.

\code{plapply} is used to parallelize execution of \code{func}.
If \code{break_batch_size} is given, slices are divided to batches, and given to \code{plapply}.
This will be used in conjunction with \code{break_err} and \code{break_err_batch},
as parallel processing apply functions are often designed to run continously and
do not allow their results to be checked before all of the computation is done.
\code{break_err_batch} is specifically used to break the cross-validation operation
if the error in the current batch exceeds the given threshold.
}


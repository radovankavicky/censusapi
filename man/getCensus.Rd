% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getcensus_functions.R
\name{getCensus}
\alias{getCensus}
\title{Retrieve Census data from a given API}
\usage{
getCensus(name, vintage = NULL, key, vars, region, regionin = NULL,
  time = NULL, date = NULL, period = NULL, monthly = NULL,
  category_code = NULL, data_type_code = NULL)
}
\arguments{
\item{name}{API name - e.g. acs5. See list at http://api.census.gov/data.html}

\item{vintage}{Year of dataset, e.g. 2014 - not required for timeseries APIs}

\item{key}{Your Census API key, gotten from http://api.census.gov/data/key_signup.html}

\item{vars}{List of variables to get}

\item{region}{Geograpy to get}

\item{regionin}{Optional hierarchical geography to limit region}

\item{time}{Optional argument used for some time series APIs}

\item{date}{Optional argument used for some time series APIs}

\item{period}{Optional argument used for some time series APIs}

\item{monthly}{Optional argument used for some time series APIs}

\item{category_code}{Argument used in Economic Indicators Time Series API}

\item{data_type_code}{Argument used in Economic Indicators Time Series API}
}
\description{
Retrieve Census data from a given API
}
\examples{
df <- getCensus(name="acs5", vintage=2014, key=censuskey,
	vars=c("B01001_001E", "NAME", "B01002_001E", "B19013_001E", "B19001_001E", "B03002_012E"),
	region="tract:*", regionin="state:06")

# Retrieve over 50 variables
df <- getCensus(name="acs5", vintage=2014, key=censuskey,
	vars=paste('B04004_', sprintf('\%03i', seq(1, 105)), 'E', sep=''),
	region="county:*")

# Get time series data
saipe <- getCensus(name="timeseries/poverty/saipe", key=censuskey,
	vars=c("NAME", "SAEPOVRT0_17_PT", "SAEPOVRTALL_PT"),
	region="state:*", time=2011)

# Loop over all states using fips list included in package
tracts <- NULL
for (f in fips) {
stateget <- paste("state:", f, sep="")
temp <- getCensus(name="sf3", vintage=1990, key=censuskey,
	vars=c("P0070001", "P0070002", "P114A001"), region="tract:*",
	regionin = stateget)
tracts <- rbind(tracts, temp)
}
}
\keyword{api}


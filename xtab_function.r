## Denne Reed, University of Texas at Austin, reedd@mail.utexas.edu
## A Funciton to convert list to an xtabs table
## Contingency tables that are read in from .cvs file using read.table or 
## read.csv produce table objects by default. For categorical data analysis
## one often wants to convert from a table to an xtabs.


as.xtab<-function(x) {
	if(!missing(x)) {
		# get the table dimensions
		nc<-ncol(x)
		nr<-nrow(x)
		## create a factor with levels equal to the number of rows
		## and repeat it for each column
		levs<-gl(nr,1,nr*(nc-1))
		
		## 
		f1<-x[levs,1]
		values<-stack(x[,2:nc])$values
		ind<-stack(x[,2:nc])$ind
		xtabs(values~f1+ind)
		}
	else cat("Usage: as.xtab(x)")
}
## as.xtab attempts to convert an imported contingency table list
## to a proper contingency table.

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
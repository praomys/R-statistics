read.data<-function(datafile,filetype="csv",table="tablename"){
	if(filetype=="csv"){
		return(read.csv(datafile))
		}
	if(filetype=="txt"){
		return(read.table(datafile,header=T))
		}
	if(filetype=="sqlite"){
		conn <- dbConnect(dbDriver("SQLite"),datafile)
		my.dataframe<-dbReadTable(conn,table)
		dbDisconnect(conn)
		return(my.dataframe)
		}
	}
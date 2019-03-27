DB=research-this.db
ALL_CSV=$(wildcard *.csv)
CMD_SQL=make-database.sql

${DB} : ${ALL_CSV} ${CMD_SQL}
	sqlite3 ${DB} < ${CMD_SQL}

clean :
	@rm -f ${DB}

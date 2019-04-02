DB=research-this.db
TABLES=category person question ranking
STRIPPED_CSV=$(patsubst %,%-stripped.csv,${TABLES})
CMD_SQL=make-database.sql

${DB} : ${STRIPPED_CSV} ${CMD_SQL}
	sqlite3 ${DB} < ${CMD_SQL}

%-stripped.csv : %.csv
	tail +2 $^ > $@

clean :
	@rm -f ${DB} ${STRIPPED_CSV}

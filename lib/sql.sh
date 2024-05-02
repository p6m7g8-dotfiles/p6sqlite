# shellcheck shell=bash

######################################################################
#<
#
# Function: stream  = p6_sqlite_sql_run()
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_sqlite_sql_run() {
    local db="$1"
    local file="$2"
    local fmt="${3:-table}"

    sqlite3 "$db" -$fmt <"$file"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_sqlite_filter_sql_run(db, [fmt=table])
#
#  Args:
#	db -
#	OPTIONAL fmt - [table]
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_sqlite_filter_sql_run() {
    local db="$1"
    local fmt="${2:-table}"

    sqlite3 "$db" -$fmt

    p6_return_stream
}

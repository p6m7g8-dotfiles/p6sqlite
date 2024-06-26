# shellcheck shell=bash

######################################################################
#<
#
# Function: p6_sqlite_db_create()
#
#>
######################################################################
p6_sqlite_db_create() {
    local db="$1"

    p6_file_rmf "$db"
    p6_file_create "$db"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_sqlite_db_drop(db)
#
#  Args:
#	db -
#
#>
######################################################################
p6_sqlite_db_drop() {
    local db="$1"

    p6_file_rmf "$db"

    p6_return_void
}

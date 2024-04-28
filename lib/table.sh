# shellcheck shell=bash

######################################################################
#<
#
# Function: p6_sqlite_file_to_table()
#
#  Environment:	 INSERT
#>
######################################################################
p6_sqlite_file_to_table() {
    local db="$1"
    local table="$2"
    local file="$3"

    local line
    while read -r line; do
       local values=$(p6_echo "$line" | p6_filter_sql_escape_single_quote | p6_filter_translate_words_to_sql_list "|")
        sqlite3 "$db" "INSERT INTO $table VALUES ('$values');"
    done <"$file"

    p6_return_void
}

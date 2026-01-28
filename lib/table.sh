# shellcheck shell=bash

######################################################################
#<
#
# Function: p6_sqlite_filter_pipe_to_table(db, table, column_list, [sep=|])
#
#  Args:
#	db -
#	table -
#	column_list -
#	OPTIONAL sep - [|]
#
#>
######################################################################
p6_sqlite_filter_pipe_to_table() {
    local db="$1"
    local table="$2"
    local column_list="$3"
    local sep="${4:-|}"

    local line
    while read -r line; do
        if p6_string_blank_NOT "$line"; then
            local values
            values=$(p6_echo "$line" | p6_filter_sql_escape_single_quote | p6_filter_translate_words_to_sql_list "$sep")
            sqlite3 "$db" "INSERT INTO $table ($column_list) VALUES ($values);"
        fi
    done

    p6_return_void
}

#!/bin/sh

main() {
    . ../p6common/lib/_bootstrap.sh
    p6_bootstrap "../p6common"

    . lib/db.sh
    . lib/sql.sh
    . lib/table.sh

    p6_test_setup "1"

    p6_test_start "p6_sqlite_filter_pipe_to_table"
    (
        local db_file="test_table.sqlite"
        p6_sqlite_db_create "$db_file"

        local create_sql="create.sql"
        echo "CREATE TABLE items (id INTEGER, code TEXT);" > "$create_sql"
        p6_sqlite_sql_run "$db_file" "$create_sql"
        
        echo "1|alpha" > data.txt
        echo "2|beta" >> data.txt
        
        cat data.txt | p6_sqlite_filter_pipe_to_table "$db_file" "items" "id, code"
        
        # Verify
        # shellcheck disable=2046
        local output=$(echo "SELECT code FROM items WHERE id=2;" | p6_sqlite_filter_sql_run "$db_file" "list")
        if p6_string_eq "$output" "beta"; then
             p6_test_ok "pipe to table verified"
        else
             p6_test_not_ok "pipe to table verified"
             p6_test_diagnostic "expected beta, got $output"
        fi
    )
    p6_test_finish

    p6_test_teardown
}

main "$@"

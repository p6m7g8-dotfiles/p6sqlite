#!/bin/sh

main() {
    . ../p6common/lib/_bootstrap.sh
    p6_bootstrap "../p6common"

    . lib/db.sh
    . lib/sql.sh

    p6_test_setup "2"

    p6_test_start "p6_sqlite_sql_run"
    (
        local db_file="test_sql.sqlite"
        p6_sqlite_db_create "$db_file"
        
        local sql_file="test.sql"
        echo "CREATE TABLE test (id INTEGER, name TEXT);" > "$sql_file"
        echo "INSERT INTO test VALUES (1, 'foo');" >> "$sql_file"
        echo "INSERT INTO test VALUES (2, 'bar');" >> "$sql_file"
        
        p6_sqlite_sql_run "$db_file" "$sql_file"
        
        # Verify insertion
        echo "SELECT name FROM test WHERE id=1;" > "verify.sql"
        # shellcheck disable=2046
        local output=$(p6_sqlite_sql_run "$db_file" "verify.sql" "list")
        if p6_string_eq "$output" "foo"; then
             p6_test_ok "sql run insert verified"
        else
             p6_test_not_ok "sql run insert verified"
             p6_test_diagnostic "expected foo, got $output"
        fi
    )
    p6_test_finish

    p6_test_start "p6_sqlite_filter_sql_run"
    (
        local db_file="test_sql_filter.sqlite"
        p6_sqlite_db_create "$db_file"
        
        local sql_file="setup.sql"
        echo "CREATE TABLE test (id INTEGER, name TEXT);" > "$sql_file"
        echo "INSERT INTO test VALUES (2, 'bar');" >> "$sql_file"
        p6_sqlite_sql_run "$db_file" "$sql_file"

        # shellcheck disable=2046
        local output=$(echo "SELECT name FROM test WHERE id=2;" | p6_sqlite_filter_sql_run "$db_file" "list")
        if p6_string_eq "$output" "bar"; then
             p6_test_ok "filter sql run verified"
        else
             p6_test_not_ok "filter sql run verified"
             p6_test_diagnostic "expected bar, got $output"
        fi
    )
    p6_test_finish

    p6_test_teardown
}

main "$@"

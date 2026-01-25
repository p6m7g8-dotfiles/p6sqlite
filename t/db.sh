#!/bin/sh

main() {
    . ../p6common/lib/_bootstrap.sh
    p6_bootstrap "../p6common"

    . lib/db.sh

    p6_test_setup "2"

    local db_file="test_db.sqlite"

    p6_test_start "p6_sqlite_db_create"
    (
        p6_sqlite_db_create "$db_file"
        if [ -f "$db_file" ]; then
             p6_test_ok "db created"
        else
             p6_test_not_ok "db created"
        fi
    )
    p6_test_finish

    p6_test_start "p6_sqlite_db_drop"
    (
        p6_sqlite_db_drop "$db_file"
        if [ ! -f "$db_file" ]; then
             p6_test_ok "db dropped"
        else
             p6_test_not_ok "db dropped"
        fi
    )
    p6_test_finish

    p6_test_teardown
}

main "$@"

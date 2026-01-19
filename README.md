# P6's POSIX.2: p6sqlite

## Table of Contents

- [Badges](#badges)
- [Summary](#summary)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Usage](#usage)
  - [Hooks](#hooks)
  - [Functions](#functions)
- [Hierarchy](#hierarchy)
- [Author](#author)

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

TODO: Add a short summary of this module.

## Contributing

- [How to Contribute](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Hooks

- `deps` -> `p6df::modules::p6sqlite::deps()`
- `init` -> `p6df::modules::p6sqlite::init(_module, dir)`

### Functions

#### p6sqlite

##### p6sqlite/init.zsh

- `p6df::modules::p6sqlite::deps()`
- `p6df::modules::p6sqlite::init(_module, dir)`

#### p6sqlite/lib

##### p6sqlite/lib/db.sh

- `p6_sqlite_db_create()`
- `p6_sqlite_db_drop(db)`

##### p6sqlite/lib/sql.sh

- `stream  = p6_sqlite_filter_sql_run(db, [fmt=table])`
- `stream  = p6_sqlite_sql_run()`

##### p6sqlite/lib/table.sh

- `p6_sqlite_filter_pipe_to_table()`

## Hierarchy

```text
.
├── init.zsh
├── lib
│   ├── db.sh
│   ├── sql.sh
│   └── table.sh
└── README.md

2 directories, 5 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>

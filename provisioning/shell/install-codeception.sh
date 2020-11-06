#!/usr/bin/env bash
if ! command -v codecept > /dev/null 2>&1; then
    curl -fsSL https://codeception.com/codecept.phar -o /usr/local/bin/codecept
    chmod ugo+x /usr/local/bin/codecept
fi

#!/usr/bin/env bash
if ! command -v phpunit > /dev/null 2>&1; then
    curl -LsS https://phar.phpunit.de/phpunit-9.0.1.phar -o /usr/local/bin/phpunit
    chmod ugo+x /usr/local/bin/phpunit
fi
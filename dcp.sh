#!/bin/bash
dcp() {
    args="$@"
    COMPOSE_CMD="${COMPOSE_CMD:-docker compose}"
    if [[ "$args" = *reload* ]]; then
        prefix=${args%"reload"*}
        suffix=${args#"$prefix"}
        suffix=${suffix/"reload"/"up"}
        (set -x; eval "$COMPOSE_CMD down && $COMPOSE_CMD $prefix$suffix")
        return 0
    fi
    (set -x; eval "$COMPOSE_CMD $args")
}

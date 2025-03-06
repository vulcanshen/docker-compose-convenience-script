#!/bin/bash
dcp() {
    args="$@"
    COMPOSE_CMD="${COMPOSE_CMD:-docker compose}"
    if [[ "$args" = *reload* ]]; then
        prefix=${args%"reload"*}
        suffix=${args#"$prefix"}
        upArg=${suffix/"reload"/"up"}
        downArg=${suffix/"reload"/"down"}
        downArg=${downArg/"-d"/""}
#        (set -x; eval "$COMPOSE_CMD down && $COMPOSE_CMD $prefix$suffix")
        (set -x; eval "$COMPOSE_CMD $prefix$downArg")
        (set -x; eval "$COMPOSE_CMD $prefix$upArg")
        return 0
    fi
    (set -x; eval "$COMPOSE_CMD $args")
}

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
        eval "$COMPOSE_CMD $prefix$downArg"
        eval "$COMPOSE_CMD $prefix$upArg"
        return 0
    elif [[ "$args" = "ps" ]]; then
        eval "$COMPOSE_CMD ps --format \"table {{.Image}}\t{{.Name}}\t{{.Service}}\t{{.Status}}\t{{.Ports}}\""
        return 0
    fi
    eval "$COMPOSE_CMD $args"
}

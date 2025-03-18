#!/bin/bash
dcp() {
    args="$@"
    last="${!#}"
    COMPOSE_CMD="${COMPOSE_CMD:-docker compose}"
    if [[ "$args" = *reload* ]]; then
            prefix=${args%"reload"*}
            suffix=${args#"$prefix"}
            upArg=${suffix/"reload"/"up"}
            downCmd="$COMPOSE_CMD down $last"
            upCmd="$COMPOSE_CMD $prefix$upArg"
            echo "$downCmd"
            eval "$downCmd"
            echo "$upCmd"
            eval "$upCmd"
            exit 0
    elif [[ "$args" = "ps" ]]; then
            eval "$COMPOSE_CMD ps --format \"table {{.Image}}\t{{.Name}}\t{{.Service}}\t{{.Status}}\t{{.Ports}}\""
            exit 0
    fi
    
    cmd="$COMPOSE_CMD $args"
    echo "$cmd"
    eval "$cmd"
}

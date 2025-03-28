#!/bin/bash
dcp() {
    args="$@"
    COMPOSE_CMD="${COMPOSE_CMD:-docker compose}"
    if [[ "$args" = *reload* ]]; then
            prefix=${args%"reload"*}
            suffix=${args#"$prefix"}
            upArg=${suffix/"reload"/"up"}
            downArg=$(echo $args | sed -E 's/reload//g' | sed -E 's/-[^ ]+//g' | sed -E 's/[ ]{2,}/ /g')
            echo $downArg
            downCmd=$(echo "$COMPOSE_CMD down $downArg" | sed -E 's/[ ]{2,}/ /g')
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

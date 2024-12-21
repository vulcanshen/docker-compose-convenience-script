dcp() {
    args="$@"
    COMPOSE_CMD="${COMPOSE_CMD:-docker compose}"
    if [[ "$args" == "reload" ]]; then
        (set -x; $COMPOSE_CMD down && $COMPOSE_CMD up -d)
        return 0
    fi
    (set -x; $COMPOSE_CMD $args )
}
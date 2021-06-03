#!/bin/bash
set -eo pipefail

CVD_DIR="${CVD_DIR:=/mnt/cvdupdate}"

# Configuration Functions
check_config() {
    if [ ! -e $CVD_DIR/config.json ]; then
        echo "Missing CVD configuration. Creating..."
        cvd config set --config $CVD_DIR/config.json --dbdir $CVD_DIR/databases --logdir $CVD_DIR/logs
        echo "CVD configuration created..."
    fi
}

show_config() {
    echo "CVD-Update configuration..."
    cvd config show --config $CVD_DIR/config.json
    echo "Current contents in $CVD_DIR/databases directory..."
    ls -al $CVD_DIR/databases
}

# CVD Database Functions
check_database() {
    if [ ! -e $CVD_DIR/databases ]; then
        echo "Missing CVD database directory. Attempting to update..."
        check_config
        show_config
        update_database
    fi
}

serve_database() {
    if [ -e $CVD_DIR/databases ]; then
        echo "Hosting ClamAV Database..."
        if [ -e /mnt/Caddyfile ]; then
            echo "Using mounted Caddyfile config..."
            exec caddy run --config /mnt/Caddyfile --adapter caddyfile
        else
            echo "Using default Caddyfile config..."
            # exec caddy file-server --listen :8080 --browse --root $CVD_DIR/databases
            exec caddy run --config ./Caddyfile --adapter caddyfile
        fi
    else
        echo "CVD database is missing..."
        exit 1
    fi
}

update_database() {
    echo "Updating ClamAV Database..."
    cvd update --config $CVD_DIR/config.json
    echo "ClamAV Database updated..."
}

# Argument Handler
case "$1" in
status)
    check_config
    show_config
;;

serve)
    check_database
    serve_database
;;

update)
    check_config
    show_config
    update_database
;;

*)
    echo "Usage: $0 {status|serve|update}"
    exit 1
esac

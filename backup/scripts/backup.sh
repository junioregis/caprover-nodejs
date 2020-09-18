#!/bin/bash

ROOT_DIR="/backup"

# Root Dirs
DAILY_DIR="${ROOT_DIR}/daily"

# Create Root Dirs
mkdir -p ${DAILY_DIR}

# Keep Control
KEEP_DAILY="90"

# Label
LABEL=$(date +%Y%m%d)

# Create Workdir
mkdir -p ${LABEL}

# Database Dir
DB_DIR="${LABEL}/db"
DB_PATH="${DB_DIR}/db-${LABEL}.tar.gz"

# Uploads Dir
UPLOADS_DIR="${LABEL}/uploads"
UPLOADS_PATH="${UPLOADS_DIR}/uploads-${LABEL}.tar.gz"

# Create Directories
mkdir -p ${DB_DIR}
mkdir -p ${UPLOADS_DIR}

function log() {
    text="$*"
    printf "${text}\n"
}

function db() {
    log ">>> BACKUP DATABASE"

    PGPASSWORD=${DB_PASS} pg_dump -Ft \
        -h ${DB_HOST} \
        -U ${DB_USER} \
        -d ${DB_NAME} >${DB_PATH} &

    dump_pid=$!

    wait ${dump_pid}
    result_code=$?

    if [[ ${result_code} -eq 0 ]]; then
        log "OK"
    else
        log "Error"
    fi
}

function uploads() {
    log ">>> BACKUP UPLOADS"

    tar -C /tmp \
        -cf ${UPLOADS_PATH} uploads &

    tar_pid=$!

    wait ${tar_pid}
    result_code=$?

    if [[ ${result_code} -eq 0 ]]; then
        log "OK"
    else
        log "Error"
    fi
}

function clean() {
    log ">>> CLEAN"

    rm -rf $(ls -d ${DAILY_DIR}/* | sort | uniq -u | awk "NR >${KEEP_DAILY}")

    log "OK"

    echo
}

db
uploads
clean

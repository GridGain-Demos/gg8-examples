#!/usr/bin/env bash
#
# Helper to build gg8-examples against a sibling GridGain CE clone.
#
# Reads the CE project version from $CE_DIR/pom.xml (default: ../gridgain)
# and forwards `-Drevision=<that-version>` to Maven so the examples build
# against the CE artifacts you've already installed.
#
# Prerequisite: the sibling CE clone must already be installed into your
# local Maven repository. From the CE checkout:
#
#     mvn -DskipTests install
#
# Usage:
#     bin/build.sh [maven args...]            # e.g. bin/build.sh clean test
#     CE_DIR=/path/to/gridgain bin/build.sh   # if CE isn't at ../gridgain
#
set -euo pipefail

CE_DIR="${CE_DIR:-../gridgain}"
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [ ! -f "$CE_DIR/pom.xml" ]; then
    echo "error: CE pom.xml not found at $CE_DIR/pom.xml" >&2
    echo "hint:  clone gridgain/gridgain alongside this repo, or set CE_DIR." >&2
    exit 1
fi

ignite_version="$(mvn -B -q -f "$CE_DIR/pom.xml" \
    help:evaluate -Dexpression=project.version -DforceStdout)"

echo "==> CE version: $ignite_version" >&2

cd "$PROJECT_ROOT"
exec mvn "-Drevision=$ignite_version" "$@"

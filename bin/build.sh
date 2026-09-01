#!/usr/bin/env bash
#
# Copyright 2026 GridGain Systems, Inc. and Contributors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Helper to build gg8-examples against a local GridGain CE source tree.
#
# Reads the CE project version from $CE_DIR/pom.xml (default: ../gridgain)
# and forwards `-Drevision=<that-version>` to Maven so the examples build
# against the CE artifacts you've already installed.
#
# Prerequisite: that CE source tree must already be installed into your
# local Maven repository. From the CE directory:
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
    echo "hint:  place the CE source tree at ../gridgain, or set CE_DIR." >&2
    exit 1
fi

ignite_version="$(mvn -B -q -f "$CE_DIR/pom.xml" \
    help:evaluate -Dexpression=project.version -DforceStdout)"

echo "==> CE version: $ignite_version" >&2

cd "$PROJECT_ROOT"
exec mvn "-Drevision=$ignite_version" "$@"

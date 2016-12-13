#!/usr/bin/env sh

KI67_PROJECT_DIR="/Users/marco/XamarinProjects/Ki67Analysis"
KI67_ANALYZER_FILES="${KI67_PROJECT_DIR}/Ki67Analyser/bin/Debug/"

TARGET_BUILD_DIR=./app/

cp -p ${KI67_ANALYZER_FILES}/* ${TARGET_BUILD_DIR}

cd ${TARGET_BUILD_DIR}
tar -zcvf ki67_bundle.tar.gz *


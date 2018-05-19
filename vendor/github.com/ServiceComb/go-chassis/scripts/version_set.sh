#!/bin/bash
set -e
set -x

CURRENT_DIR=$(cd $(dirname $0);pwd)
CHASSIS_DIR=$(dirname $CURRENT_DIR)

FRAMEWORK_FILE="$CHASSIS_DIR/core/metadata/framework.go"

if [ ! -f "$FRAMEWORK_FILE" ]; then
    echo "$FRAMEWORK_FILE not exist!"
    exit 1
fi

version=${1:-"0.1"}
cat << EOF > $FRAMEWORK_FILE
// Code generated by go-chassis/scripts/version_set.sh. DO NOT EDIT.

// Package metadata provides framework info registered to registry.
package metadata

// constant for sdk version, name, registration component
const (
	SdkVersion                    = "$version"
	SdkName                       = "Go-Chassis"
	SdkRegistrationComponent      = "SDK"
	PlatformRegistrationComponent = "PLATFORM"
)
EOF
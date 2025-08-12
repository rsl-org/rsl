#!/bin/bash

for f in "$(dirname "$0")"/*; do
    if [ -d "$f" ]; then
        conan editable add "$f"
    fi
done

#!/bin/bash

for f in *; do
    if [ -d "$f" ]; then
        conan editable add $f
    fi
done
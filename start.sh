#!/bin/bash

mkdir -p /src/sd3-cache/public

if [ ! -f /src/sd3-cache/model_index.json ]; then
    python /src/scripts/download_hf_model.py
fi

python -m cog.server.http

#!/bin/bash

if [ -f /src/weights/large-v2.pt ]
then
    echo "Weights already exist"
else
    /src/scripts/get_weights.sh
fi

python -m cog.server.http

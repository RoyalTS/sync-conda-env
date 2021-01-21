#!/bin/bash

ENV_FILE='environment.yml'

# (--from-history: no versions, no build info)
# (--no-builds: with versions but no build info)
EXPORT_ARGS=$1

echo "Checking Conda environment '$CONDA_DEFAULT_ENV' for changes..."

CONDA_YAML=$(conda env export $EXPORT_ARGS | grep -v "prefix")
DIFF=$(echo "$CONDA_YAML" | git diff --no-index -- "$ENV_FILE" -)

if [ "$DIFF" != "" ]
then
    echo "Changes were found in the Conda environment!"
    echo "$DIFF"

    # update the ENV_FILE upon request
    if [[ "$*" == *--mutate* ]]
        then
            echo "Updating $ENV_FILE."
            echo "$CONDA_YAML" > "$ENV_FILE"
    fi
    exit 1
else
echo "Conda environment '$CONDA_DEFAULT_ENV' unchanged."
fi

exit 0

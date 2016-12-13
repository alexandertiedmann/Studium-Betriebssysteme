#!/usr/bin/env sh

printStderr()
{
  local INPUT=$1
  >&2 echo "[DEBUG] ${INPUT}"
}

printStderr $(which python)

RETURN_CODE=${?}

exit ${RETURN_CODE}

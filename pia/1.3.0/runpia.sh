#!/bin/bash
set -e

if [ "$1" = 'pia' ]; then
  shift
  exec java -jar "${PIA_JAR}" "$@"
elif [ "$1" = 'compiler' ]; then
  shift
  exec java -cp "${PIA_JAR}" de.mpc.pia.intermediate.compiler.PIACompiler "$@"
fi

echo "run either 'pia' or 'compiler' (or anything else to not execute pia but e.g. start the bash)"
exec "$@"

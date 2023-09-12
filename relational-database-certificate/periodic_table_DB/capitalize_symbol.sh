#!/bin/bash

PSQL="psql -U freecodecamp -d periodic_table -t -A -c"


SYMBOL_ROWS=$($PSQL "SELECT symbol FROM elements")
while IFS='|' read -r ORIGINAL; do
  MODIFIED=$(echo "$ORIGINAL" | awk '{ print toupper(substr($0, 1, 1)) substr($0, 2) }')
  $PSQL "UPDATE elements SET symbol = '$MODIFIED' WHERE symbol = '$ORIGINAL'"
done <<< "$SYMBOL_ROWS"
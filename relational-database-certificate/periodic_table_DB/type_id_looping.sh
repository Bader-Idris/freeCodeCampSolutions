#!/bin/bash

PSQL="psql -U freecodecamp -d periodic_table -t -A -c"
# -A, --no-align unaligned table output mode

# Fetch the rows from the table
PROPERTIES_ROWS=$($PSQL "SELECT type FROM properties")
# Loop through the rows
while IFS='|' read -r TYPE; do
  # Check the condition and update column1 if needed
  if [[ "$TYPE" == "metal" ]]; then
    TYPES_ID=$($PSQL "SELECT type_id FROM types WHERE type = '$TYPE'")
    $PSQL "UPDATE properties SET type_id = $TYPES_ID WHERE type = '$TYPE'"
  fi
  if [[ "$TYPE" == "metalloid" ]]; then
    TYPES_ID=$($PSQL "SELECT type_id FROM types WHERE type = '$TYPE'")
    $PSQL "UPDATE properties SET type_id = $TYPES_ID WHERE type = '$TYPE'"
  fi
  if [[ "$TYPE" == "nonmetal" ]]; then
    TYPES_ID=$($PSQL "SELECT type_id FROM types WHERE type = '$TYPE'")
    $PSQL "UPDATE properties SET type_id = $TYPES_ID WHERE type = '$TYPE'"
  fi

done <<< "$PROPERTIES_ROWS"
# we can use :lower: or :upper: 
# as: [[ 'b' == [[:lower:]] ]]; echo $?






# #!/bin/bash

# PSQL="psql -U freecodecamp -d periodic_table -t -A -c"

# SYMBOL_ROWS=$($PSQL "select symbol from elements")
# while IFS='|' read -r SYMBOL; do
#   echo $SYMBOL | cut -c 1 | tr '[:lower:]' '[:upper:]'
  
# done <<< "$SYMBOL_ROWS"

# # mix both together, which appears to be hard
#   SUBSYMBOL=$($PSQL "select substring(symbol, 2) from elements")
#   while IFS='|' read -r SUB_CH; do
#     if [[ -n $SUB_CH ]]; then
#       echo $SUB_CH howdy
#     fi
#   done <<< "$SUBSYMBOL"

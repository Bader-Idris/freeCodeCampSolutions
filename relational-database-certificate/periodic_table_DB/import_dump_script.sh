#!/bin/bash

# Set the PGPASSWORD environment variable
export PGPASSWORD=$(cat ~/.pgpass | awk -F: '{if ($1 == "localhost") print $5}')

# Run the psql command to import the SQL dump file
psql -U postgres -d salon -p 5433 < periodic_table.sql

# there are some conflicts as freecodecamp doesn't exists in my local machine, and port 5433 is 5432 in it,
#  which is weird, but I need to set similar craziness in production projects,
#  I think that'll make hackers hate themselves for a while 😲

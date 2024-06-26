# this course is built of 14 section

- It starts from building a boilerplate website by bash. [see the curriculum](https://www.freecodecamp.org/learn/relational-database/#learn-git-by-building-an-sql-reference-object)
- 1. *Learn Bash by Building a Boilerplate*
- 2. *Learn Relational Databases by Building a Mario Database*
- 3. *Celestial Bodies Database*
- 4. *Learn Bash Scripting by Building Five Programs*
- 5. *Learn SQL by Building a Student Database: Part 1*
- 6. *Learn SQL by Building a Student Database: Part 2*
- 7. *World Cup Database*
- 8. *Learn Advanced Bash by Building a Kitty Ipsum Translator*
- 9. *Learn Bash and SQL by Building a Bike Rental Shop*
- 10. *Salon Appointment Scheduler*
- 11. *Learn Nano by Building a Castle*
- 12. *Learn Git by Building an SQL Reference Object*
- 13. *Periodic Table Database*
- 14. *Number Guessing Game*

---

## 1. section bash basics

- this section's having 170 lessons, and building a boilerplate website, the camp sends you to a private vscode environment to solve questions
- first mission is easily asking you to print hello terminal in VSC terminal by opening a CLI as `ctrl + shift + title` and commanding: `echo hello terminal`
- 2nd assignment => type `pwd` => `print working directory` to see the directory
- next, `ls` stands for `list`
- `cd` stands for `change directory` `cd <filename>`
- then 5 practicing, folders are `blue` by default, when typing ls
- `cd ..` AYK; I'm not gonna count quizzes anymore, they're too many, and that's awesome
- to see what's in a folder/file 🤗 before accessing it type: `more <DIR name>`. the awesome thing is seeing file's data. 🔴 use `cat` it works always, not as `more` might and might need to be installed
- `clear`, and AYK though
- to get options with listing use: `ls <flag>` as `ls -l` => long list format
- each `new folder` has slash in front of it
- to go back two DIRs do `cd ../..`
- `mkdir <DIR name>` making a directory AYK
- to create a file use `touch <file.ext>`
- `touch .gitignore` is hidden, check the helping of a `command <flag>` as `ls --help`, works in bash, my vsc didn't accept it, might need installing pure bash internally, you can use `git bash`, internally and externally
- to see hidden content, you can see with --help, it's `--all`, or `-a` for short
- to copy files into another DIR, as a nested dir, for moving imgs after creating them with `touch` command use: `cp <file> <destination>` 🤗 command, as `cp background.jpg images`
- now we're having duplicated jpg, so remove the prior one, as `rm <fileName>`
- to rename a file we use the moving command, because it can rename and move, syntax: `mv <fileName> <new_fileName>`, as `mv roboto.font roboto.woff`

---

- half of the course😃

---

- to check all file tree, seeing all nested/descendant files with their path, use `find`
- to impact in a subfolder we do `command <folder>/<tended_command>` as creating a new folder in a nested folder `mkdir client/src`
- you can see the tree of a different dir as `find <folderName>`
- see the usability of `find --help` see the `-name`!
- -name is for finding a file in a folder as `find -name <folderName>` ie: `find -name index.html client` | theres something wrong in using it with outer dirs 🤔 why
- `rmdir` -> remove directory `rmdir <directory_name>`, should be empty, or you need another command
- practice: `mkdir file/subDIR/subDIR/tendedCreation`, same as creating files: `touch file/subDIR/subDIR/tendedCreation/file.ts`
- to delete filled dir search for `rm --help`, turns out using -r flag does it. as `rm -r fonts`. if you use it arbitrarily, you might destroy your operating system.😒
- as you learned in linux course by enki `take a course from freeCodeCamp instead, it wasn't good as video explaining`, you can print into files themselves as:
- `echo text >> filename`🔴, as `echo I made this boilerplate README.md`, and check it with `more README.md`
- if `more` doesn't work, try `cat` it's much better, or try: `less`
- to copy hole dir, same as when deletion, `-r` will do, `cp -r directory_name`

## 2. postgres, mario Database

- as in prior course, run the terminal `echo hello PostgreSQL` they asked to print
- machine's installed the app, the credential data is: `psql --username=freecodecamp --dbname=postgres`
- firstly we `CREATE DATABASE first_database;`, then check databases with `\l`, telling that if CREATE DATABASE doesn't appear, there's a bug, might be because of the lack of semicolon
- as you know: `\c database_name` to connect, prompt changed to db_name, as known, `\d` to see tables
- parenthesis are needed when creating tables, `1TABLE first_table();`
- adding tables: `ALTER TABLE table_name ADD COLUMN column_name DATATYPE;`, ie:

```sql
ALTER TABLE second_table ADD COLUMN first_column INT;--integer
-- to drop columns do following:
ALTER TABLE second_table DROP COLUMN id;
```

- VARCHAR(99) as known, string with maximum value, ie: `ALTER TABLE second_table ADD COLUMN name VARCHAR(30);`
- you can rename the column as `ALTER TABLE table_name RENAME COLUMN column_name TO new_name;`
- insertion, as you know, need to include str into single quotes
- this star is an asterisk (*)
- deletion `DELETE FROM table_name WHERE condition`
- to drop databases you've to be unconnected to them
- after we created a mario_database, add created a characters() table, we added some columns starting with:

```sql
ALTER TABLE characters ADD COLUMN character_id SERIAL;
```

- SERIAL not only auto increment, but also, gives a constraint: NOT NULL
- another approach of inserting many values on behalf of tediously adding solo ones

```sql
INSERT INTO characters(name, homeland, favorite_color)
VALUES('Mario', 'Mushroom Kingdom', 'Red'),
('Luigi', 'Mushroom Kingdom', 'Green'),
('Peach', 'Mushroom Kingdom', 'Pink');
```

- to change values, do following:
- `UPDATE table_name SET column_name=new_value WHERE condition`
- order by column: is known, only remember desc & asc
- identifying by PRIMARY KEYs; note: should be set for each table
- `ALTER TABLE table_name ADD PRIMARY KEY(column_name)`
- drop the primary key:
- `ALTER TABLE table_name DROP CONSTRAINT constraint_name;`
- In our case, the primary key's name is🔴: `characters_pkey`

---

- foreign keys

```sql
ALTER TABLE table_name ADD COLUMN column_name DATATYPE REFERENCES referenced_table_name(referenced_column_name);
-- as following:
ALTER TABLE more_info ADD COLUMN character_id INT REFERENCES characters(character_id);--yet one-to-one relationship
-- enforce their relationship with a unique constraint
ALTER TABLE table_name ADD UNIQUE(column_name);
-- they say it should be not null
-- adding it to a foreign key:
ALTER TABLE more_info ALTER COLUMN character_id SET NOT NULL;--🔴
```

- see an example of useful insertion, date formats as `'YYYY-MM-DD'`

```sql
INSERT INTO more_info(birthday, height, weight, character_id)
VALUES('1981-07-09', 155, 64.5, 1);-- NULL can be used instead of weight-height numbers, same as leaving empty
```

- view a good example of adding many constraints together;

```sql
ALTER TABLE sounds ADD COLUMN filename VARCHAR(40) NOT NULL UNIQUE;
```

- when connecting many tables to a one, we call this a one-to-many relationship, as the book designing data-intensive applications explain about twitter

```SQL
ALTER TABLE table_name ADD COLUMN column_name DATATYPE CONSTRAINT REFERENCES referenced_table_name(referenced_column_name);
-- example of using constraint in same command
ALTER TABLE sounds ADD COLUMN character_id INT NOT NULL REFERENCES characters(character_id);
```

- adding two filename values, to same foreign key value

```sql
INSERT INTO sounds(filename, character_id) VALUES ('yay.wav',3),('woo-hoo.wav',3);
```

- Now let's make our new table actions as a many-to-many relationship field
- after easily creating it: `ALTER TABLE actions ADD COLUMN action VARCHAR(20) UNIQUE NOT NULL;`
- see: `INSERT INTO actions(action) VALUES('run');`, insert another as 'jump', & another as 'duck'
- 🔴 we usually use a `junction` table in many-to-many relationships, to link two tables together 🔴
- initially creating the table `CREATE TABLE character_actions();`, this junction table uses the primary keys from both `characters` and `actions` tables, as foreign keys to create the relationship
- then we create a character_id `ALTER TABLE character_actions ADD COLUMN character_id INT NOT NULL;`
- to set existing columns use

```sql
ALTER TABLE table_name ADD FOREIGN KEY(column_name) REFERENCES referenced_table(referenced_column);
-- real example
ALTER TABLE character_actions ADD FOREIGN KEY(character_id) REFERENCES characters(character_id);
-- setting another foreign key in same character_actions TABLE
ALTER TABLE character_actions ADD FOREIGN KEY(action_id) REFERENCES actions(action_id);
```

- with this character_actions table, we'll create more than one primary key, which is called `composite` primary key
- an example

```sql
ALTER TABLE table_name ADD PRIMARY KEY(column1, column2);
-- real example
ALTER TABLE character_actions ADD PRIMARY KEY(character_id, action_id);
```

- so both of these ids are gonna have multiple rows for each, so neither is unique, both they'll never conflict being in a single row as same id for both
- this is how we inserted actions and character ids into the character_actions TABLE:

```SQL
INSERT INTO character_actions(character_id,action_id) VALUES
(7,1),(7,2),(7,3);
-- same as Daisy, only changing 7 into 6
```

- look at the hard work I'v done:

```sql
\d
mario_database=>                         List of relations
+--------+-----------------------------+----------+--------------+
| Schema |            Name             |   Type   |    Owner     |
+--------+-----------------------------+----------+--------------+
| public | actions                     | table    | freecodecamp |
| public | actions_action_id_seq       | sequence | freecodecamp |
| public | character_actions           | table    | freecodecamp |
| public | characters                  | table    | freecodecamp |
| public | characters_character_id_seq | sequence | freecodecamp |
| public | more_info                   | table    | freecodecamp |
| public | more_info_more_info_id_seq  | sequence | freecodecamp |
| public | sounds                      | table    | freecodecamp |
| public | sounds_sound_id_seq         | sequence | freecodecamp |
+--------+-----------------------------+----------+--------------+
(9 rows)
-- see also the characters we started after creating the mario_database
SELECT * FROM characters ORDER BY character_id;
mario_database=>                                
+--------------+--------+------------------+----------------+
| character_id |  name  |     homeland     | favorite_color |
+--------------+--------+------------------+----------------+
|            1 | Mario  | Mushroom Kingdom | Red            |
|            2 | Luigi  | Mushroom Kingdom | Green          |
|            3 | Peach  | Mushroom Kingdom | Pink           |
|            4 | Toad   | Mushroom Kingdom | Blue           |
|            5 | Bowser | Koopa Kingdom    | Yellow         |
|            6 | Daisy  | Sarasaland       | Orange         |
|            7 | Yoshi  | Dinosaur Land    | Green          |
+--------------+--------+------------------+----------------+
(7 rows)

-- see the more_info table

SELECT * FROM more_info;
mario_database=>                                      
+--------------+------------+--------------+--------------+--------------+
| more_info_id |  birthday  | height_in_cm | weight_in_kg | character_id |
+--------------+------------+--------------+--------------+--------------+
|            1 | 1981-07-09 |          155 |         64.5 |            1 |
|            2 | 1983-07-14 |          175 |         48.8 |            2 |
|            3 | 1985-10-18 |          173 |         52.2 |            3 |
|            4 | 1950-01-10 |           66 |         35.6 |            4 |
|            5 | 1990-10-29 |          258 |        300.0 |            5 |
|            6 | 1989-07-31 |              |              |            6 |
|            7 | 1990-04-13 |          162 |         59.1 |            7 |
+--------------+------------+--------------+--------------+--------------+
(7 rows)
```

- to see the real data from more_info, in character_id column we use join on, getting data from both tables

```sql
SELECT columns FROM table_1 FULL JOIN table_2 ON table_1.primary_key_column = table_2.foreign_key_column;
```

- real example:

```sql
SELECT * FROM characters FULL JOIN more_info ON characters.character_id = more_info.character_id;
-- this is called a one-to-one relationship as learned above
-- another example with sounds table joined to characters one
SELECT * FROM characters FULL JOIN sounds ON characters.character_id = sounds.character_id;
```

- a real world example of seeing many-to-many one-to-many relationship

```sql
-- explaining the theory part:
SELECT columns FROM junction_table
FULL JOIN table_1 ON junction_table.foreign_key_column = table_1.primary_key_column
FULL JOIN table_2 ON junction_table.foreign_key_column = table_2.primary_key_column;

-- the example
SELECT * FROM character_actions
FULL JOIN characters ON character_actions.character_id = characters.character_id FULL JOIN actions ON character_actions.action_id = actions.action_id;
-- that was a lot🥵
```

- Congratulations, finally; now let's get more crazy with next course😃

---
---

## 3. Celestial Bodies Database

- For this project, you will build a database of celestial bodies using PostgreSQL.
- useful notices:

```txt
If you leave your virtual machine, your database may not be saved. You can make a dump of it by entering pg_dump -cC --inserts -U freecodecamp universe > universe.sql in a bash terminal (not the psql one). It will save the commands to rebuild your database in universe.sql. The file will be located where the command was entered. If it's anything inside the project folder, the file will be saved in the VM. You can rebuild the database by entering psql -U postgres < universe.sql in a terminal where the .sql file is.

If you are saving your progress on freeCodeCamp.org, after getting all the tests to pass, follow the instructions above to save a dump of your database. Save the universe.sql file in a public repository and submit the URL to it on freeCodeCamp.org.
```

- I created a `universe.sql` in my machine instead of that boring issue
- all created data is inside that file, I finished this challenge at 5:25 PM 8/11/2023

---

## 4. Bash scripts combine terminal commands combined to programming

220 lessons 🥵, Bash scripts combine terminal commands and logic into programs that can execute or automate tasks, and much more.

In this 220-lesson course, you will learn more terminal commands and how to use them within Bash scripts by creating five small programs.

- we'll create a file `project`, and `touch questionnaire.sh` in it
- this file is for containing commands inside, first command is

### First Project

```sh
echo hello questionnaire
```

- to run that command type: `sh fileName.ext`, sh stands for shell
- sh uses the shell interpreter, so run the scripting with bash, `bash` => `bourne-again shell`, as `bash questionnaire.sh`
- to see where the bash is interpreting from type: `which bash`
- to tell our program where the shell is, add this at the top of the command file:

```sh
shebang #!<path_to_interpreter>
# as this, checked by freeCodeCamp tests:
#!/bin/bash
```

- after that, instead of using sh or bash, we can execute the file by typing its name precede by ./ as `./questionnaire.sh`, but it'll deny with lack of permissions
- the reason is because privileges are not including x -> execute, you learned before what 777 means; use `ls -l` to check permissions
- our file is: `-rw-r--r--`, I think they're admin, user, others
- enter `chmod +x questionnaire.sh` in the terminal, to give all -🤪- execution

now, you're able to execute ./questionnaire.sh

- you can even add the command `ls -l` into the file. that's awesome

bash has variables, functions, and what not

- creating variables is similar to dotenv;
- `VARIABLE_NAME=VALUE` 🔴 you're not able to add spaces around `=` sign, when needing spaces, include the code with double quotes
- to use variables add `$VARNAME`, putting dollar sign in front of it
- to accept input from users use: `read` command as `read NAME`, then, i'll store it into that variable. so, it wasn't set before, the `NAME`;

the file is as:

```sh
#!/bin/bash
QUESTION1="What's your name?"
echo $QUESTION1
read NAME
echo Hello $NAME.
```

- it'll output the input that user adds when you run the file: ./questionnaire.sh
- we create a tile with two ~~ as, it might be a personal style😃 from the monitor
echo ~~ Questionnaire ~~
- --help with echo doesn't work as `echo --help`, it prints it😃
- another helping command is `man` => manual, used as `man echo`
- as known: `ctrl + c` stops the running script
- echo didn't print empty lines as -e and \n
- to make it working add double quotes as: `echo -e "\n~~ Questionnaire ~~\n"`
- `-e` enable the interpretation of escape sequences.
- -e should be used each time you use `escape sequences`.

First program's done, its code's:

```sh
#!/bin/bash
echo -e "\n~~ Questionnaire ~~\n"
QUESTION1="What's your name?"
QUESTION2="Where are you from?"
QUESTION3="What's your favorite coding website?"
echo $QUESTION1
read NAME
echo $QUESTION2
read LOCATION
echo $QUESTION3
read WEBSITE
echo 
echo -e "Hello $NAME from $LOCATION. I learned that your favorite coding website is $WEBSITE!"
```

### Second Project

- create 2nd project with `touch countdown.sh`, in same project DIR
- give it: `chmod +x countdown.sh`
- to see all passed to thy script arguments do: `echo $*`, it prints empty line🤔
- we can get arguments with their ordered place with `$<number>` as `./countdown.sh` in terminal, and setting: `echo $1` in the file.
- to see the list of inline commands use: `help`
- with many commands try: `help <command>` it'll return brief useful info on it, as `help if`
- the meaning is:

```sh
if [[ CONDITION ]]
then
  STATEMENTS
fi
```

- There must be spaces on the inside of the brackets ([[ ... ]]) and around the operator (==).
- this is how countdown.sh became after adding this if condition:

```sh
#!/bin/bash

# Program that counts down to zero from a given argument

if [[ $1 == arg1 ]]]
then
  echo true
fi
```

- try in terminal running the file with arg1 as: `./countdown arg1`, with else commands, it will return nothing
- it doesn't work properly in my windows. that's weird
- we should to set a default condition here, as:

```sh
if [[ CONDITION ]]
then
  STATEMENTS
else
  STATEMENTS
fi
```

- You can compare integers inside the brackets ([[ ... ]]) of your if with `-eq` (equal), `-ne` (not equal), `-lt` (less than), `-le` (less than or equal), `-gt` (greater than), `-ge` (greater than or equal).
- make 1st if as: `if [[ $1 -lt 5 ]]`
- we can even ask for help with [[ ]] commands as: `help [[ expression ]]`.
- and use:🔴`help test`.🔴 it's good for same topic
- use: -le stands for `<=`
- to be able to print this command: `[[ 4 -le 5 ]]` we need to use `$?` => `exit status`
- so do this in terminal, each line is as pressing enter:

```sh
[[ 4 -le 5 ]]
$?
```

- it returns 0. in their syntax they said: `the exit status of 0 means it was true`
- so, 0 == true. 1 == false. that's weird. not same as JS. the real meaning is: 🔴 `app had zero errors` 🔴
- to separate commands on same line use `semicolon`. as `[[ 4 -ge 5 ]]; echo $?`
- in bash: the exit status of `127` means `command not found`. as trying with `bad_command; $?`
- if you use `ls; $?` it'll return 0. and get executed. will list output!
- this `ls -y; $?` returns 2 so it says -y flag doesn't work with ls
- to check if a file exists as in `help test`. use `[[ [[ -a countdown.sh ]]; echo $? ]]`. 0 not bugs. 😋
- we can ask for help with [[ expression ]] as `help [[ expression ]]` or `help [[`
- this is used after seeing its power, `[[ -x countdown.sh && 5 -le 4 ]]; echo $?`. because && it returns a whole error: 1. if || is used. it'll return 0

now come to looping:

```sh
for (( i = 10; i > 0; i-- ))
do
  echo $i
done
```

- here is our app after inserting the `2nd in help` for loop:

```sh
#!/bin/bash

# Program that counts down to zero from a given argument

if [[ $1 -gt 0 ]]
then
  for (( i = $1; i > 0; i-- ))
  do
    echo $i
  done
else
  echo Include a positive integer as the first argument.
fi
```

- run the script with a number as: 10, `./countdown.sh 10`
- to use time learn as: `help`. not seen?, use `ls /` to get more `built-in commands`.
- we can see the `bin` => binary. check it with `ls /bin`. these aren't built-in commands
- `bash` is for using `shebang`, learn more about `sleep`, we'll use it for pausing time in looping
- use `man sleep` to do so.
- use `sleep <seconds>`

```sh
: '
  this is a multiple comment 
  approach
'
```

- see the final result of the file. I changed
- this is the pseudo code of while loops in bash:

```sh
while [[ CONDITION ]]
do
  STATEMENTS
done
```

- to subtract in while loops use `(( ... ))` as `(( I-- ))`

### Third Project

bingo number generator

```sh
touch bingo.sh
chmod +x bingo.sh
ls -l # to see it
```

- add the shebang as, after checking `which bash`

```sh
#!/bin/bash
```

- we need sth that helps us generating random numbers between 1-75, check environment variables, command: `printenv` to see them
- it's a lot of information, I admit, so it's extremely useful knowing its parts🔴
- they're predefined and loaded with each shell, mentor says!
- check `LANG`, we'll use it! as `echo $LANG`
- View all variables in the shell with `declare -p`. `-p` stands for `print`
- this list included all env variables, even what you've created in current shell
- this one is important to know: `RANDOM` print it, `echo $RANDOM`, and voilà ![Alt text](image.png)
- change the number var into its value as: `NUMBER=$RANDOM`
- highest number that random can generate is: `32767` not 65535, as signed in 16-bit, to determine its maximum value use `echo $((2 ** 15 - 1))`. this line isn't in the course😃
- to make it in our tended range we use the modulus operator `%`, after it with our n, as: `$RANDOM%75`
- to see what we can do with `(( ))` use the command: `help let`
- we can easily use: `(( I += 10 ))` to increment 10 each time
- using `$` before (()), will output results with an error message: as `bash: 16: command not found` with `$(( I + 4 ))`
- print it with echo to get rid of that error message: `echo  $(( I + 4 ))`
- in the practices we did this: `echo $(( J * 5 + 25 ))`. I know nothing why🤔
- the idea is about that `(( ))` is set for isolate its arguments from saving collected data. `Output nothing`
- see

```md
# So, as a reminder, (( ... )) will perform a calculation or operation and output nothing. $(( ... )) will replace the calculation with the result of it. You made a few variables in this shell, view them with declare -p.
```

- to view created variables use `declare -p VAR` as putting `I` in place of VAR
- using `declare -p RANDOM` will generate different results each time
- they asked to type: `echo $(( RANDOM % 75 ))`. The concerning issue is that it puts many zeros on left.🥵
- they directly showed the solution, it's by adding 1 in the calculating parentheses, as `echo $(( RANDOM  % 75 + 1 ))`
- we can if statements with (( ... )), not only with square [[ ... ]].
- else if is similar to python, `elif`
- see the file `bingo.sh` to view the ability to use both of (( ... )) and [[ ... ]] together

### Fourth Project

- we'll build a fortune project.

```sh
touch fortune.sh
chmod +x fortune.sh
```

- arrays in bash are having this syntax: `ARR=("a" "b" "c")`
- and invoking is as: `echo ${ARR[1]}`
- to print the whole array we use either `*` or `@`, as `echo ${ARR[*]}`
- see the array with `declare -p ARR`
- it prints `declare -a`, -a stands for array
- 🔴 Notice: there ain't any comma in between!🔴
- to get a random number between 0 and 5 we use: RANDOM % 6, why 6. I don't know.
- use `help function` in terminal, they're as ecma 5 fn(){}
- no dollar sign needed for function. remember: bash is a scripting lang: runs 1 to (length -1)
- see the `until` command `help until`, same as `do while looping`
- `=~` means is substring matching? `[[ hello =~ el ]]; echo $?` => 0, zero bugs
- we can use regExp characters, but not in ""
- this asks if it starts with h, `^` asks for first character. `[[ "hello world" =~ ^h ]]; echo $?` => 0
- this `^h.+d$` means: is it starting with h, and `.+`: is it having at least 1 ch, `d$` is it ending with d. -> 0
- with vars use `$` as `[[ $VAR == "hello world" ]]; echo $?`
- to check if string ends with ? use `\?$`, with `[[ $VAR =~ \?$ ]]; echo $?`, using `$?`, is with each matching `=~`

### Fifth Project

- Program to run my other four programs

```sh
touch five.sh
chmod +x five.sh
```

- give shebang in file.sh=> `#!/bin/bash`
- after including ./filename.sh for each project, and countdown with its argument.
- learn more about `type`, with `help` -> `help type`
- it appears the type of command
- both `echo` and `read` are builtin commands. but if is a keyword. check with `type <command>`
- `type bash` => returns the location of bash. same as `which bash` but with little explanation
- do: `type psql`. it'll return its package location

this course is done in 12:23 AM 8/13/2023. midnight? YES🦉

## 5. Building a Student DB in SQL: Part 1

Initially they provide two csv files, courses and students

- put these two files inside SQL DB: 🤪
- CS students with their courses. I put these files in this file's location/studentsDB

Run psql as in prior DB courses: `psql --username=freecodecamp --dbname=postgres`

- create db students
- 4 tables: 1- students with info. 2- majors 3- courses 4- viewing what courses in each majors!
- look at `./students_part1.sql` file.
- after creating the tables and adding a row for each at a time. it's tedious to do so for all.
- so, we'll `split the terminal`, in vsc click on terminal in the upper nav -> `split terminal` or `ctrl + shift + 5`
- then, create a file for inserted data: `touch insert_data.sh` in `project` DIR.
- that's awesome using split terminal => `...terminals together`
- give permissions to file.
- add shebang. rest is in the file!
- we'll use `cat <filename>` for `printing` whole files. inside our scripting_file.
- using this shell while read with its followed variable will put all separated strings into these two variables:

```sh
cat courses.csv | while read MAJOR COURSE
do
  echo $MAJOR
done
# and here we only print the majors, as you can see
# but the problem is that it only prints first word 🔴 for each
```

- There's a default `IFS` variable in bash. `IFS` stands for **"Internal Field Separator"**. View it with `declare -p IFS`
- it's for determining word boundaries; It defaults to `spaces`, `tabs`, and `new lines`.
- set it to comma as `IFS=","`; between `while` and `read` commands as: `while IFS="," read`
- instead of printing it. we'll insert into the database directly!
- with scripting we can run a single command and quit in psql, do the following:

```sh
PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
```

- `-c` is for running the script once and quit.
- to query our psql `prompt` we do this: `$($PSQL "<query_here>")`.
- code in () will run in a subShell
- instead of using the original file: `courses.csv`, we'll cp a new one for testing purposes
- in testing file remove all but 5 lines, **leave an empty line afterwards**
- do `cp courses.csv courses_test.csv`
- change the file read by cat to new one. in the scripting file.
- after the changes, run the scripting file.
- we inserted the column name. so we can use the deletion command in shell.
- `TRUNCATE`. by using it with table's name. postgreSQL will delete all data inside. as

```sql
TRUNCATE majors;
-- it can't because of having constraints
```

- we need to delete this row from all connected tables, they're 2 other than our major, do it by separating them with commas

```sql
TRUNCATE majors, students, majors_courses;
-- then trunk courses.
TRUNCATE majors_courses, courses;
-- not only courses. because it has a fKey references to majors_courses
```

- then run the scripting file.
- put an if $MAJOR != major. for the title.
- we don't need to print this any more, `echo $INSERT_MAJOR_RESULT`
- we truncate connected tables as `truncate majors_courses, students, majors;` with testing
- we'll make the file delete the table's data dynamically. THAT'S RISKY
- initially we make it below PSQL as:

```sh
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")
```

- after we set the insert_data.sh as:

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database
PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")
cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != major ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted into majors, $MAJOR"
    fi
    fi
    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
      # get new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into courses, $COURSE"
      fi
    fi
    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted into majors_courses, $MAJOR : $COURSE"
    fi
  fi
done
```

- we'll cp the testing students file
- as: `cp students.csv students_test.csv`
- and we'll remove all but 5 and its next empty \n as in prior file
- we're copying what we did, in same file. it's funny now. practicing what we learned
- look at it now:

```sh
# prior code⬆️...
cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  if [[ $FIRST != first_name ]]
  then
  # get major_id
  # if not found
  # set to null
  # insert student
  fi
done
```

- then after all tasks. and selecting rows to see in each table. we'll remove the testing files
- we're going to do is making our dump of DB. the `pg_dump` command does it. use: `pg_dump --help`. in my windows. it needs to be installed!
- it puts data into a sql file. use 🔽 to create that `students.sql` file

```sh
pg_dump --clean --create --inserts --username=freecodecamp students > students.sql
```

- I put the output file besides what I created. It's tidy in a crazily approach 🤪

## 6. Building a Student DB in SQL: Part 2

- mentors: In this 140-lesson course, you will complete your student database while diving deeper into SQL commands.
- we'll insert the who student.sql into our database. because it'l not existing when starting this course.
- do this with `psql -U postgres < students.sql` command
- we're gonna create this `student_info.sh` to sort the data info of our project;
- do as any other `sh` file. +x and shebang
- see the file!
- we didn't use this before: `SELECT * FROM majors where major != 'Game Design';`
- the majority of this course stands for teaching selection, which's been explained in postgres course with Nelson. and the great book SQL cookbook
- we can chain a condition with one of two as `WHERE <condition_1> AND (<condition_2> OR <condition_2>)`
- as `select * from students where last_name < 'M' and (gpa = 3.9 or gpa < 2.3);`, without () it will consider (condition31 and condition32) or condition3
- this brings what does not have a space, as we learned before: `select * from courses where course not like '% %';`
- order is important, you can't put `limit` before `order by` or both before `where` clause.
- an example:

```sql
select * from students where gpa is not null order by gpa desc, first_name limit 10;
```

- look at the psuedo code of this ROUND method

```sql
ROUND(<number_to_round>, <decimals_places>)
```

- `COUNT()` is for column numbers, overlooking the nullish values
- as you recall: using `DISTINCT` will remove duplicated results from viewing
- we get the same results with both of these selections

```sql
select distinct(major_id) from students;
select major_id from students group by major_id;
```

- but with `group by` we can use `aggregation fns`: `min max count etc`
- **this was tough:**  View the unique major_id values with GROUP BY again, but see what the lowest GPA is in each of them.

```sql
SELECT major_id, MIN(gpa) FROM students GROUP BY major_id;
```

- this is another option with group by: `SELECT <column> FROM <table> GROUP BY <column> HAVING <condition>`
- `having` clause's to be an aggregate Fn with a test, as `HAVING COUNT(*) > 0`
- see the example:

```sql
SELECT major_id, MIN(gpa) AS min_gpa, MAX(gpa) AS max_gpa FROM students GROUP BY major_id HAVING MAX(gpa) = 4;
```

- you know aliases. not gonna explain it here!
- this is becoming a little more complex

```sql
select major_id, count(*) as number_of_students from students group by major_id having count(*) < 8;
```

- the file `student_info.sh` is extremely useful for this Part 2 of SQL learning
- to join use:

```sql
SELECT * FROM tb1 FULL JOIN tb2 ON tb1.fKeyColumn = tb2.fKeyColumn;
-- as this real example one:
SELECT * FROM students FULL JOIN majors ON students.major_id = majors.major_id;
```

- The `FULL JOIN` clause you used will include all rows from both tables, whether or not they have a row using that foreign key in the other.
- `left join` gets only connected from Tb2 to Tb1, it joins the right to left table.
- so, this returns all students but only connected majors with it, as majors is in the right side of our selection.

```sql
SELECT * FROM students LEFT JOIN majors ON students.major_id = majors.major_id;
```

- to convert the condition only use `RIGHT` instead of left as:

```sql
SELECT * FROM students RIGHT JOIN majors ON students.major_id = majors.major_id;
```

- using `INNER JOIN` returns only tables.rows if both tables have the fKey value connected to the other one.

```sql
SELECT * FROM students INNER JOIN majors ON students.major_id = majors.major_id;
```

- so, they're 4 `JOIN` clauses: `FULL`, `LEFT`, `RIGHT` and `INNER`.
- some practices:

```sql
-- Try using a LEFT JOIN to show all the majors but only students that have a major.
SELECT * FROM majors LEFT JOIN students ON majors.major_id = students.major_id;

-- Next, use the appropriate join to show only students that are enrolled in a major, and only majors that have a student enrolled in it.
SELECT * FROM students INNER JOIN majors ON students.major_id = majors.major_id;

-- Try using a right join to show all students but only majors if a student is enrolled in it.
SELECT * FROM majors RIGHT JOIN students ON majors.major_id = students.major_id;

-- Use the appropriate join with the same two table to show all rows in both tables whether they have a value in the foreign key column or not.
SELECT * FROM majors FULL JOIN students ON majors.major_id = students.major_id;

-- Say you wanted to find a list of majors that students are taking. Use the most efficient JOIN to join the two tables you need. Only join the tables for now, don't use any other conditions.
SELECT * FROM students INNER JOIN majors ON students.major_id = majors.major_id;

-- Just get the column you need. without duplicates.
SELECT DISTINCT(major) FROM students INNER JOIN majors ON students.major_id = majors.major_id;

-- list of majors that students aren't taking
SELECT * FROM students RIGHT JOIN majors ON students.major_id = majors.major_id;
```

- last joins are really difficult. go see them! especially when arriving at 83% progress
- this is useful after mastering!🤪

```sql
SELECT first_name, last_name, major, gpa  FROM students LEFT JOIN majors ON students.major_id = majors.major_id WHERE major = 'Data Science' OR gpa >= 3.8;
```

- the mentor question are killing me! and 🚘 me 🥜
- an example of craziness

```sql
SELECT first_name, major FROM students FULL JOIN majors ON students.major_id = majors.major_id WHERE first_name LIKE '%ri%' OR major LIKE '%ri%';
```

- look at the toughness, I got 95% near it , I even got the same results, so it's 99% 😃 without hints:

```sql
SELECT major FROM students FULL JOIN majors ON students.major_id = majors.major_id WHERE major IS NOT NULL AND (student_id IS NULL OR first_name ILIKE '%ma%') ORDER BY major;
```

- because when I was trying to select major_id when working with joins and received errors: **do this**
- choose as an object, see: `table.major_id`, meaning: you'll have to pick it from one of both. as this:

```sql
SELECT students.major_id FROM students FULL JOIN majors ON students.major_id = majors.major_id;
```

- we can use aliases with selection itself as:

```sql
SELECT s.major_id FROM students as s FULL JOIN majors as m ON s.major_id = m.major_id;
```

- seeing s at the beginning as an alias before even arriving is awesome
- we can use the short cut keyword `USING` to use same fKey names, a pseudo ie:

```sql
SELECT * FROM <table_1> FULL JOIN <table_2> USING(<column>);
-- Use this method to see all the columns in the students and majors table. Don't use any aliases.
SELECT * FROM students FULL JOIN majors USING(major_id);
```

- this pseudo code is how to join three tables instead of two:

```sql
SELECT * FROM <table_1> FULL JOIN <table_2> USING(<column>) FULL JOIN <table_3> USING(<column>)
```

- ⚠️🔴 it will count first 2 as left table when using left-right joins! 🔴⚠️
- making it real one

```sql
SELECT * FROM students FULL JOIN majors USING(major_id) FULL JOIN majors_courses USING(major_id);
```

- we can join as many tables as we want, see:

```sql
SELECT * FROM students FULL JOIN majors USING(major_id) FULL JOIN majors_courses USING(major_id) FULL JOIN courses USING(course_id);
```

- this was really tough, and I wasn't able to get it!

```sql
-- List of unique courses, in reverse alphabetical order, that no student or 'Obie Hilpert' is taking:
SELECT DISTINCT(course) FROM students RIGHT JOIN majors USING(major_id) INNER JOIN majors_courses USING(major_id) INNER JOIN courses USING(course_id) WHERE (first_name = 'Obie' AND last_name = 'Hilpert') OR student_id IS NULL ORDER BY course DESC;
```

- because it's too difficult practice on it [here:](https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial)
- Part 2, done in 8/14/2023

## 7. World Cup Database

- at the end of the course, we'll need to provide these three files `worldcup.sql`,`insert_data.sh`, and `queries.sh`
- I'll put them all in a nested folder called: `world-cup`.

---

### **Outside the curriculum**

- if you wanna print-echo some code each time the file is running you can use this lovely approach, especially when adding a password as with my local psql, because I tried making it automatically providign the password, by creating a file in the users/currentUser as `.pgpass`, but it din't work, even after giving it all permissions to execute🥵

```sh
echo "howdy" | ./five.sh
# this might work, but I didn't try it!
while true; do
    echo "admin" | psql -U postgres
    if [[ $? != 0 ]]; then
        break
    fi
done
```

---

- to recall the dump file after finishing the project, do this

```sh
# file exists in dir:
# this is how we created the dump file
pg_dump -cC --inserts -U freecodecamp worldcup > worldcup.sq
# created-from-server-dump-file/
psql -U postgres < worldcup.sql
```

- worldCup challenging required project is all done & submitted in 11:09 AM 8/17/2023

---

## 8. Learn Advanced Bash by Building a Kitty Ipsum Translator
<!-- بسم الله الرحمن الرحيم -->

- this learning project started with two files, I've put them in its dir
- then we created a file with little printing command: `echo hello bash > stdout.txt`
- Notice that we used only one single `>` sign.
- it redirected echo output,⚠️🔴 and more important overwrite its content⚠️🔴.
- to `append to`, instead of `overwrite` we use two `-gt` signs -> `>>`.
- using `> stdout.txt` as is, will empty the file. `one space > <fileName>`
- using `bad_command > stderr.txt` will create the file, but not accept to write anything inside
- our two types of output `stdout` (standard out), and `stderr` (standard error)
- You can redirect `stderr` with `2>` as: `bad_command  2> stderr.txt`. that means, the output of bad_command went to the file stderr.txt.⚠️ this is awesome for typing the passwd on behalf of me! with psql permission🔴, and ⚠️🔴notice: nothing printed to the terminal!⚠️🔴
- similarly we use: `1>`, as `echo hello bash 1> stdout.txt`, `stdout` and `stderr` are for output. `stdin` (standard in) is the third thing commands can use and is for getting input.`defaults to the keyboard`.

- using `read` will interact with the `stdin`, when using `read NAME` stdin points to the keyboard, and sth:`babe`, using `echo $NAME` to get output.
- now use this `echo` to output the result to the file `stdout.txt`, and redirect the `stdout` to `stdout.txt`, and overwrite it, as `echo $NAME 1> stdout.txt`, the output goes to stdout.txt without telling the terminal!
- `IMPORTANT:` Just like you can redirect output, you can redirect `stdin` as well. Here's an example: `<command> < <filename_for_stdin>`.
  - use this: `read NAME < name.txt`.🔴
  - now the (standard in) is pointed to name.txt.
  - by using `echo $NAME` after that, the variable is set to the content of the file.
  - Another way to set the `stdin` is by using the pipe `(|)`. It will use the output from one command as input for another.
  - Here's an example: `<command_1> | <command_2>`. This will take the `stdout` from `command_1` and use it as the `stdin` for `command_2`.
  - real example:
    - Task: Use this method to **echo** your name and pipe the output into the `read` command which reads your name into the `NAME` variable.
    - RES: `echo bader | read NAME`.
    - then print it: `echo $NAME`
    - it doesn't appear because it ran the command in a subShell or subprocess
    - `cat` is another command, to take input, it prints it to the `stout`: type str then press Enter, ctr + c to stop the process, which prints what you provide again
    - `cat` can take a file name as an argument, so you can do this: `cat name.txt`
      - here is an example: `cat < name.txt` then print it as: `echo bader | cat`
        - its pseudo is: `<command1> | <command2>`
- here's a full example:

```sh
touch script.sh
chmod +x script.sh
# shebang it, remember which bash🤓
echo '#!/bin/bash' > script.sh
echo 'read NAME' > script.sh
echo 'echo Hello $NAME' > script.sh
# that's ugly, but I'm doing to practice, you can enter the file do that inside it🤓
echo 'bad_command' > script.sh
# now, it takes input from (stdin) and will output to (stdout) and (stderr); run it without any input.
./script.sh
# now <read> is waiting for input: name => Enter
Bader
# it returns: ./script.sh: line 5: bad_command: command not found
# now, use the pipe to echo the input, instead of printing both commands
echo Bader | ./script.sh
:'
  /o1: Hello Bader
  /o2: ./script.sh: line 5: bad_command: command not found
so, it did not ask for input here.
# redirect the stderr to stderr.txt
'
echo Bader | ./script.sh  2> stderr.txt
# this is how to redirect stderr to its file, and stdout to its one. so it will appear neither stderr nor stdout 🔴⚠️this is awesome⚠️🔴
echo Bader | ./script.sh  2> stderr.txt > stdout.txt
```

- You can redirect both the `stderr` and `stdout` by adding another redirection at the end like this: `> <filename>`. as :1013 👆
- Run your script again, use redirection to set `name.txt` as the input. Don't redirect any of the output.

```sh
./script.sh < name.txt
# run same, but redirect err to stderr
./script.sh < name.txt 2> stderr.txt
# add the stdout to them
./script.sh < name.txt 2> stderr.txt > stdout.txt
```

- the new command to you: `wc` this can take place of `cat` command, it can shows data about file added to it
  - as this: `27  332 1744 kitty_ipsum_1.txt` for `wc kitty_ipsum_1.txt`
  - check manual command for help! `man wc`, it didn't work in my Windows, so I tried `wc --help`, 
    - it stands for: `word count`, it's awesome:
      - `wc -l` shows line length
      - `wc -w` -> words🦑
      - `wc -m` print the characters counts
      - `wc -c` bytes
      - `27  332 1744 kitty_ipsum_1.txt` => `-l -w -c` in order
      - some characters are more than one byte!
- **Task:** Use `cat` to pipe the content of the file as the input of the `wc` command to see if the output is the same.

```sh
# answer:
cat kitty_ipsum_1.txt | wc
# it only printed the numbers without fileName, this time!
# code above output is similar, but with fewer spaces as:
wc < kitty_ipsum_1.txt
# then we add this line within kitty_info.txt as:
echo -e "\nNumber of lines:" >> kitty_info.txt
```

- with this 👇 command we read the content of `kitty_ipsum_1.txt` by `cat`, then pipe the line length by wc -l into the other file, `kitty_info.txt`

```sh
cat kitty_ipsum_1.txt | wc -l >> kitty_info.txt
# so, the kitty_info.txt will have a new line with line length: 27
```

🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴
what's after this line's not been tested, because of the stupidity of server running the code. so I'll do it manually, then see the hint's solution.
**check line 605 in TUTORIAL.md**
might happen with next project as well, until we see what they're gonna do with this crazy bug!
🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴

- print: -e "\nNumber of words:" into kitty_info.txt.
- I do:

```sh
echo -e "\nNumber of words:" >> kitty_info.txt
# ✅
# next is to send words count with same prior code but changing the flag into the word one, -w ✅
cat kitty_ipsum_1.txt | wc -w >> kitty_info.txt
```

- now do the number of characters, print the title then the command, easy, isn't it?

```sh
echo -e "\nNumber of characters:" >> kitty_info.txt

#this is correct, but not what mentors what!👇
cat kitty_ipsum_1.txt | wc -m >> kitty_info.txt
# Use the redirection method as the input for the `wc` command this time instead of the piping method.
# ie: <command> < <input_filename> >> <output_filename>
wc -m < kitty_ipsum_1.txt >> kitty_info.txt
```

- we can search for a word pattern using: `grep`, when you search for a 'meow' it'll return lines with that pattern, pseudo is: `grep '<pattern>' <filename>`, as:

```sh
grep 'meow' kitty_ipsum_1.txt
# some outputs
:'
hide from vacuum cleaner meow for catnip and act crazy steal
shirt howl or gimme attention meow bye and eat grass, meow, and
i stare at it i meow at it i do a wiggle come here birdy ears
'
```

- learn more about grep with its manual as `man grep`, my git bash doesn't accept it, it does with: `grep --help`
- it's more useful and lovelier using `--color` flag with `grep`, see:

```sh
grep --color 'meow' kitty_ipsum_1.txt
# what's sincerely lovelier is using -n with that, for getting all line numbers with our command:
grep -n --color 'meow' kitty_ipsum_1.txt
# or, 👇 is what mentors are providing, but both works
grep --color -n 'meow' kitty_ipsum_1.txt
```

- to see how many times those two words appear we use the seems to be regExp pattern with the word as: `meow[a-z]*`, check:

```sh
grep --color 'meow[a-z]*' kitty_ipsum_1.txt
# they're 7, but we don't see anything that counts, so we use the flag -c as:
grep -c 'meow[a-z]*' kitty_ipsum_1.txt
# it counts lines per FILE
```

- it is the flag: `-o` that returns cutted out pattern

```sh
grep -o 'meow[a-z]*' kitty_ipsum_1.txt
```

- now, we can use the `wc` method to get its count, with pipe as:

```sh
grep -o 'meow[a-z]*' kitty_ipsum_1.txt | wc -l
# it returns how many words👌, for printed lines, I tested -w, as for words and it words here!
```

- append that to kitty_info.txt

```sh
grep -o 'meow[a-z]*' kitty_ipsum_1.txt | wc -l >> kitty_info.txt
# then add this
echo -e "\nLines that they appear on:" >> kitty_info.txt
```

- how to get only line numbers? check the manual!

```sh
# nothing appears! 😒 ugly helping docks 🤪
```

- we can use the command: `sed` which replaces text,
- `sed` can replace text like this: `sed 's/<pattern_to_replace>/<text_to_replace_it_with>/' <filename>`. it defaults to output to `stdout`
- use it to replace r in `name.txt > freeCodeCamp` to be `2` becomes: `f2eeCodeCamp`, do this:

```sh
sed 's/r/2/' name.txt
```

- now: replace `free` with `f233` with same method:

```sh
sed 's/free/f233/' name.txt
# try it with replacing: 'freecodecamp' to 'f233C0d3C@mp'.
sed 's/freecodecamp/f233C0d3C@mp/' name.txt
# it didn't replace anything, because of the lack of tended string to be replaced
```

- because it didn't replace it, we can use regExp flags as: gim as we know, after the last slash
- ignore cases with its regExp flag:

```sh
sed 's/freecodecamp/f233C0d3C@mp/i' name.txt
# it only replace the terminal results for now!
# use same code but redirect its **input** this time
sed 's/freecodecamp/f233C0d3C@mp/i' < name.txt
```

- mentors wanted to use `cat` and `pipe` method to set the input for `sed` cm.

```sh
cat name.txt | sed 's/freecodecamp/f233C0d3C@mp/i'
# It didn't change text inside the name.txt file.
```

- We can use `sed` to each line in that output with just line numbers, to match the first digit it finds on each line, and replace it with `1` as:

```sh
grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed 's/[0-9]/1/'
```

- to make it matches one or more, we use the regExp pattern `[0-9]+` on behalf of prior one.

```sh
grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed 's/[0-9]+/1/'
```

- that didn't replace anything! **check its manual**
- we want the extended regular expressions, which has `-E`, add it to thy prior regExp

```sh
grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed -E 's/[0-9]+/1/'
# so, its job is to change the -n lines into our tendency, looks like it's to make each line returns the word count
```

- we need to `capture` our numbers, so, we use this pattern with `sed`. `'s/([0-9]+)/\1/'`

```sh
grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed -E 's/([0-9]+)/\1/'
# now, we need to add .* to our sed expression, so it matches everything, captures the numbers, and replaces everything with the captured numbers. as:
grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed -E 's/([0-9]+).*/\1/'
# it's finally useful now, getting only the lines that has meow patterns. 🥵
```

- now add that craziness to `kitty_info.txt`

```sh
grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed -E 's/([0-9]+).*/\1/' >> kitty_info.txt
# easy now 😆
```

- now, we'll get info about words that starts with `cat` 🐱

```sh
grep --color 'cat[a-z]*' kitty_ipsum_1.txt
```

- print this in info file:

```sh
echo -e "\nNumber of times cat, cats, or catnip appears:" >> kitty_info.txt
```

- we need to redo the number checking with `grep` and `sed` for this pattern

```sh
# firstly to see only matching words
grep -o 'cat[a-z]*' kitty_ipsum_1.txt
# then pipe the output of their count:
grep -o 'cat[a-z]*' kitty_ipsum_1.txt | wc -l
# add that into info file
grep -o 'cat[a-z]*' kitty_ipsum_1.txt | wc -l >> kitty_info.txt
# then print this
echo -e "\nLines that they appear on:" >> kitty_info.txt
# then insert the number of their lines
grep -n 'cat[a-z]*' kitty_ipsum_1.txt | sed -E 's/([0-9]+).*/\1/' >> kitty_info.txt
```

- now: we'll work on second ipsum kitty file😒
- give it a title in same info file, boy

```sh
echo -e "\n\n~~ kitty_ipsum_2.txt info ~~" >> kitty_info.txt
echo -e "\nNumber of lines:" >> kitty_info.txt
cat kitty_ipsum_2.txt | wc -l >> kitty_info.txt
echo -e "\nNumber of words:" >> kitty_info.txt
# use the redirection instead of the pipe method for its input
wc -w < kitty_ipsum_2.txt >> kitty_info.txt
echo -e "\nNumber of characters:" >> kitty_info.txt
wc -m < kitty_ipsum_2.txt >> kitty_info.txt
# see the variations of 'meow' with grep with its colors
grep --color 'meow[a-z]*' kitty_ipsum_2.txt # same number as prior file
echo -e "\nNumber of times meow or meowzer appears:" >> kitty_info.txt
# don't forget using -o for only matching, not -n for line-number
grep -o 'meow[a-z]*' kitty_ipsum_2.txt | wc -l >> kitty_info.txt
echo -e "\nLines that they appear on:" >> kitty_info.txt
grep -n 'meow[a-z]*' kitty_ipsum_2.txt | sed -E 's/([0-9]+).*/\1/' >> kitty_info.txt
# remember sed replaces the matched into numbers with this example 👆
```

### creating a script file for prior kitty issues transforming into doggy ones🐶

- we'll replaces all kitty related words into doggy, for doggy people, to not make them pissed off, [WOW!](image-1.png)
- do general creation issues:

```sh
touch translate.sh
chmod +x translate.sh
# shebang
echo '#!/bin/bash' >> translate.sh
```

- the file needs to read from `stdin` as input.
- we'll need to catch the first argument passed to the script.

```sh
echo -e '\ncat $1' >> translate.sh
```

- to test it with kitty_ipsum_1.txt as an argument do:

```sh
./translate.sh kitty_ipsum_1.txt
# this is redirection to print the file👇
./translate.sh < kitty_ipsum_1.txt
```

- Try the `cat` and pipe method.

```sh
cat kitty_ipsum_1.txt | ./translate.sh
# I don't see any impaction for that!![Alt text](image-2.png)
# the idea is that kitty file is the $1 for the translate.sh✅
```

- in script file: `translate.sh` pipe the input into a `sed` that replaces `catnip` with `dogchow` using `sed` method.
- I didn't ace this one! 😵🔴
- **the file translate.sh should be as this:**

```sh
#!/bin/bash

cat $1 | sed 's/catnip/dogchow/'
```

- now we run the script with kitty_ipsum_1.txt as the argument, and see if it uses sed method

```sh
./translate.sh kitty_ipsum_1.txt
# it does work
```

- now pipe its results to a grep with its colors:

```sh
./translate.sh kitty_ipsum_1.txt | grep --color 'dogchow'
# to make sure they're replaced, test the file by changing dogchow to catnip
```

- to replace many patterns separate each with a semicolon as: `sed 's/<pattern_1>/<replacement_1>/; s/<pattern_2>/<replacement_2>/'`, but it's important to notice that all are inside the single quotes.
- now, make the file changes two patterns as:

```sh
# shebang

cat $1 | sed 's/catnip/dogchow/; s/cat/dog/'
```

- now, search using regExp as:

```sh
./translate.sh kitty_ipsum_1.txt | grep --color 'dog[a-z]*'
# test prior with
$ ./translate.sh kitty_ipsum_1.txt | grep --color 'cat[a-z]*' # found nothing! that's 👌
```

- add a thrid pattern `meow` with `woof`

```sh
# shebang

cat $1 | sed 's/catnip/dogchow/; s/cat/dog/; s/meow/woof/'
```

- to search for more than one pattern we use: `'dog[a-z]*|woof[a-z]*'`, but it needs the extended regExp flag, in terminal as:

```sh
./translate.sh kitty_ipsum_1.txt | grep --color -E 'dog[a-z]*|woof[a-z]*'
```

- becaues our script didn't include the global regExp flag, the word: `meowzer` didn't match, so we add the `g` flag in our script file, **NOTICE**: each pattern needs that flag😆
- now to make it matches the `meowzer` better, we use the `|` inside the sed regExp `meow` pattern to be as: `'s/meow|meowzer/woof/g'`

```sh
# in script
cat $1 | sed -E 's/catnip/dogchow/g; s/cat/dog/g; s/meow|meowzer/woof/g'
```

- after that we check both cat|meow and dog|woof with our `file arg | grep pattern` method

```sh
# test both files with this in terminal
./translate.sh kitty_ipsum_1.txt | grep --color -E 'dog[a-z]*|woof[a-z]*'
./translate.sh kitty_ipsum_1.txt | grep --color -E 'meow[a-z]*|cat[a-z]*'

./translate.sh kitty_ipsum_2.txt | grep --color -E 'dog[a-z]*|woof[a-z]*'
./translate.sh kitty_ipsum_2.txt | grep --color -E 'meow[a-z]*|cat[a-z]*'
```

- our script is finished! we need to save output into the new `doggy_ipsum_1.txt` file, as:

```sh
# redirect the stdout of translating cat_1 file to doggy_1 file
./translate.sh kitty_ipsum_1.txt > doggy_ipsum_1.txt
# don't use the pipe method with grep here! it's gonna be useless
```

- we can use this `diff` command to compare between files in terminal, see its pseudo code: `diff <file_1> <file_2>`
- do it with `kitty_1` and `doggy_1`

```sh
diff kitty_ipsum_1.txt doggy_ipsum_1.txt
# it returns what doesn't match
# check its manual, 🔴 if it's long, Press enter until you have seen the whole manual 🔴
```

- use the coloring difference, making red `lines that aren't in the second file`, green `lines are what they were replaced with`.
- line numbers are above each section

---

- create doggy_2 as in prior one

```sh
./translate.sh kitty_ipsum_2.txt > doggy_ipsum_2.txt
```

- view changes:

```sh
diff --color kitty_ipsum_2.txt doggy_ipsum_2.txt
```

PROJECT'S DONE AT 11:03 AM 8/21/2023

- It was a real challenge to me, and a lot of new methods

## 9.Building a Bike Rental Shop

build an interactive Bash program that stores rental information for your bike rental shop using PostgreSQL.

- this project will have a database, and a bash script to interact with it.
- connect to the psql as in prior projects

```sh
psql --username=freecodecamp --dbname=postgres
```

- I'll put basic database setting into `bikes.sql` file as in prior projects
- after we created a DB and its 3 tables, connected 2 into the first one as fKeys, and appended 9 columns to bikes table, now we'll interact with scripting
- split if you didn't! then create `bike-shop.sh` in project DIR

```sh
touch bike-shop.sh
chmod +x bike-shop.sh
echo '#!/bin/bash' > bike-shop.sh # it wasn't working, because of the double quotes, should be single quotes
```

- inside the script file do the following:

```sh

echo -e "\n~~~~~ Bike Rental Shop ~~~~~\n"

# create a function named: MAIN_MENU
MAIN_MENU() {
  echo 'How may I help you?'
  echo -e "\n1. Rent a bike\n2. Return a bike\n3. Exit"
  read MAIN_MENU_SELECTION
}
MAIN_MENU
RENT_MENU() {
  echo 'Rent Menu'
}
RENT_MENU
# check the file, it will have everything inside!
```

- after we set a function for each option that user have, we need to get what option he picks, so user submits in `main menu`, and we take them to proper `sub-menu`
- we can use `case` statement for that! an Example:

```sh
case EXPRESSION in
  PATTERN) STATEMENTS ;;
  PATTERN) STATEMENTS ;;
  PATTERN) STATEMENTS ;;
  *) STATEMENTS ;;
esac
```

- we want the `$MAIN_MENU_SELECTION` variable to be the expression
- we expect it to be a `1`, `2`, or `3` for our various menus. the `*` is for when anything else is entered ,as:

```sh
case $MAIN_MENU_SELECTION in
  1) RENT_MENU ;;
  2) RETURN_MENU ;;
  3) EXIT ;;
  *) MAIN_MENU ;;
esac
```

- we can add an argument when user picks `*`, as this:

```sh
FUNCTION_CALL "<argument_message>"
# real example:
*) MAIN_MENU "Please enter a valid option." ;;
```

- now, we'll add the PSQL variable below the shebang to get bikes available

```sh
PSQL="psql -X --username=freecodecamp --dbname=bikes --tuples-only -c"
# to be able to use it as in prior projects -> $($PSQL "<query_here>")
```

- in the else -> # display available bikes -> echo "$AVAILABLE_BIKES"
- instead of printing the output directly, pipe the output into a while loop that reads each line. see the pseudo for it:

```sh
echo "$AVAILABLE_BIKES" | while read <VAR_1> <VAR_2> <VAR_3> <VAR_4> <VAR_5>
do
  <STATEMENTS>
done
```

- it'll read the availableVar into 5 vars. each var being the next word in the line.
- those variables are same as when we read with separating each section with its comma in the worldCup project, as: `cat games.csv | while IFS="," read YEAR ROUND NAME` etc.
- it's mapping, and it's extremely important in programming!
- we checking `[[ a1 =~ [0-9] ]]; echo $?` it'll return 0, because its subsequent has matched, with 1
- to isolate the results to match only regExp pattern, we use: `^` mark, The `^` signifies the start of the pattern, and `$` means the end. as: `[[ a1 =~ ^[0-9]$ ]]; echo $?`
- `11` didn't match, because we didn't add a flag for reading more than 1 character. so add: `+` after `[0-9]`, as: `^[0-9]+$`
- so our mathcing test in terminal will be:

```sh
[[ 11 =~ ^[0-9]+$ ]]; echo $?
```

- to make not a number we use the exclamation mark `!` in front of the pattern as: [[ ! 11 =~ ^[0-9]+$ ]]
- after we checked the usages of first option, renting a bike, we set all bikes to available statement, with `UPDATE bikes SET available = true WHERE available = false;`
- the first customer was added in the script, picking a bike, then adding the number `555-5555`, next `Me` as a name.
- so we need to put the picked out bike into rentals table, and make its available as false in bikes table!
- a great way of removing `|` from a SQL result, is to use regExp as this: `echo '28 | Mountain' | sed 's/ |//'` it'll become: `28 Mountain`🔴⚠️⚠️that solves the issue of printing columns when user asks for available bikes⚠️⚠️🔴
- What you put the in subshell (`$(...)`) will be executed, and the result of it will replace the subshell. as: `BIKE_INFO_FORMATTED=$(echo $BIKE_INFO | sed 's/ |/"/')`
- 🔴view `:72-76` in bike-shop.sh to see how to format text as professionals
- the pattern `sed 's/^ *//g'` means that search for string starts with space, and ends with space, with 0 or more characters -> `*`, and `g` makes it replaceAll, `^` for starting, and if `$` exists, it means ending!
- some examples:

```sh
echo "$(echo '   M e   ' | sed 's/ *$//g')." # |   M e.|
# meaning. it'll trim all ending spaces
# putting * before $ means any matching before last one -> '$'

# and this trims initial spaces:
echo "$(echo '   M e ' | sed 's/^ *//g')." # |M e .|
```

- `|` in regExp means `or` operator
- use it to trim precede and after spaces:

```sh
echo "$(echo '   M e   ' | sed 's/^ *|*$//g')."
# It didn't work, because of not using extended
echo "$(echo '   M e   ' | sed -E 's/^ *| *$//g')." # mentors mistakenly didn't add space preceding last *
```

- so, all that suffer was just to trim the string😲,
- in second prompt we'll inner join all tables together to get rental customer when tending to return a bike, as:

```sh
SELECT * FROM bikes INNER JOIN rentals USING(bike_id) INNER JOIN customers USING(customer_id);
```

Course Is Done In: **6:47 PM 8/23/2023**

## 10. Salon Appointment Scheduler

THIS PROJECT IS REQUIRED TO OBTAIN THE DB CERTIFICATION

- For this project, you will create an interactive Bash program that uses PostgreSQL to track the customers and appointments for your salon.
- Important: After you pass all the project tests, save a dump of your database into a `salon.sql` file, as well as your `salon.sh` file, so you can complete step 2. There will be instructions how to do that within the virtual machine.
- **Notice** 🔴∵🔴 `-t` or `--tuples-only` in query is extremely important, I wasted hours of testing because i didn't use it. When you use `-z` without putting `-t` in the `PSQL` var, it'll always be not null, at least as: `(0 rows)`
- so make your `PSQL` similar to this:

```sh
PSQL="psql -U postgres -d salon -t -c"
```

- the course is easy, for an Express & JS developer, although some string issues as above were tedious.
- Finished at: **6:14 PM 8/26/2023**
- don't forget to dump the file for providing the project.

## 11. Building a Castle with Nano

you will learn how to edit files in the terminal with Nano while building a castle.

- Type `nano castle.sh` to access tended file in nano. without installing anything, it worked, it's a standard text edit in many linux distributions
- these are some popular edits that linux supports, and might have installed if nano isn't existing: `Vi/Vim or Emacs`
- to `save/write-out` press: `control + o` after modifying the file. it'll ask about fileName, leave it as is.
- press `control + x` to exit nano
- we can run that file without providing shebang with `bash <fileName>` command, in the terminal as well. as: `bash castle.sh`
- You can use `control + k` to "cut" and `control + u` to "uncut", or paste, a line. when done write out with: `control + o` to save changes
- now, we're gonna draw a castle to the terminal 😋😋
- because git nano, is so stupid, use WLS debian or ubuntu

```sh
echo "
Welcome to my castle
"

echo "
 /\                /\ 
/  \              /  \ 
|  |______________|  |
|                    |
|   []    []    []   |
|                    |
|         __         |
|________|  |________|
"
```

- the `^` means control at the button of the guide-line panel
- rerun it with `bash castle.sh`
- `M` for meta down in nano, means `meta` a key that doesn't exist in major keyboards. in `OSX` mac machines, it means `escape`, and in other OSs it means `Alt`.
- when adding this `/  \              /  \`, and what's above it, it doesn't work properly when running the file, we need to  add a `space` to prevent that storm😆, at the end as this, but replace each `x` with a space

```sh
 /\                /\x
/  \              /  \x
```

## 12. Building an SQL Reference Object With Git

In this 240-lesson course, you will learn how Git keeps track of your code by creating an object containing commonly used SQL commands.

- we created a `sql_reference` dir for handling version control with git.
- initially: turn that DIR into a git repo with: `git init`, from its direction.
- list hidden files with: `ls -a`, to see that repo
- check status, as Osama taught you, it will be your best friend: `git status`
- `main/master` is a common branch to keep tracking of production code.
- You can create and go to a new branch with `git checkout -b new_branch`. The `-b` stands for "branch". as: `git checkout -b main`
- check the status, it'll appear thy new 🌿
- after creating `README.md`, check `status`, it will be: `Untracked`, meaning: not added to git yet. First you need to add it to the staging area, `git add file_name`, that'll make it ready for commit
- after we created: `touch sql_reference.json`, we move it from `untracked` to `staging` area, as before: `git add sql_reference.json`
- to commit them, we use `git commit -m "msg"`, the flag `-m` stands for `message`, you can see the commit msg with: `git log` to check its content
- If the message is wrong, enter `git reset HEAD~1`, then `git add .`, and then you can try to make the commit again
- any commit made will make anything in staging area added to git history.

> after committing, to see the history type: `git log`
> it will write out: `username`, `email`, `date`, `commit hash`

- make sure to put an empty line at the end of the file.
- make file's content looks like:

```json
{
  "database": {
    "create": "CREATE DATABASE database_name;"
  }
}

```

- the `status` will be <span style="color:#db6a6a;">modified</span> now. which is unStaged.
- to check the difference use:

```bash
git diff
# lines with + means new added lines
```

- then: `git add sql_reference.json`. they're staged and ready for committing. do it with {msg:`feat: add create database reference`}

> Commit messages often start with `fix:` or `feat:`, among others, to help people understand what your commit was for.

- check its history with `git log`, newest will be at the top.
- after making the json file as 👇, we see one line removed and two are created, add them to the `staging` area, then commit it with: `feat: add drop database reference`

```json
{
  "database": {
    "create": "CREATE DATABASE database_name;",
    "drop":"DROP DATABASE database_name;"
  }
}

```

> Try to avoid committing in thy `main` branch, see current branch with `git branch`

- you can create a branch with: `git branch branch_name`, in often branches starts with `fix/` or `feat/` without spaces after the forward slash.

> add this branch: **feat/add-create-table-reference**.

```sh
git branch feat/add-create-table-reference
```

- that new branch is a clone of the main one. it'll have same code and commit history.

> To switch to a branch use: **git checkout branch_name**

- After checking changes with that code: `*` means current branch
- Now, we'll make this branch for what its name is, then merge it to main one, because it's not common to make main branch for committing
- add "table" along side "database" one, as:

```json
{
  "database": {
    "create": "CREATE DATABASE database_name;",
    "drop": "DROP DATABASE database_name;"
  },
  "table": {
    "create": "CREATE TABLE table_name;"
  }
}

```

- call thy best friend, then `git diff`, then add to staging area, then commit this msg: `feat: add create table reference`, then check history with: `git log`.
- because of difficult to see commits after getting longer, we use: `--oneline` with same code as:

> git log --oneline: ⚠️one line not online⚠️

- change branch with: `git checkout` to `main` one
- ⚠️changing to other branches will remove committed in other branches⚠️, we see with history that 3 comments are committed on this main branch, and 4 on prior one

> Use **git merge branch_name** to bring changes from other specific branch as the **feat** one.

- use this: `git merge feat/add-create-table-reference`
- now after safely importing data from `feat/` branch, we can delete it with:👇 -d -> delete

> **git branch -d branch_name**

- so, do the following: `git branch -d feat/add-create-table-reference`
- now: create and go to new branch named: `feat/add-drop-table-reference`. `-b` -> `branch`

```shell
git checkout -b feat/add-drop-table-reference
```

- after adding the drop key as👇, check status, then diff, then add it to stage. then commit it with: `feat: add drop table reference`

```json
// put in "table":{
  "drop":"DROP TABLE table_name;"
// }
```

---

- then switch back to `main` branch. see:1647, don't forget it doesn't appear yet. ->  view branches -> then merge prior to current with `git merge priorBranch`, then delete prior branch with `git branch -d branchName`

> The process is to create a branch, make the changes you want, commit them, and then merge the changes into branch you started on.

- do them here:

```sh
git checkout -b feat/add-column-references
:'
# this is in json file
"column": {
  "add":"ALTER TABLE table_name ADD COLUMN column_name;"
}
'
git diff
# add all with . instead of typing the name of each on its own
git add .
git commit -m "feat: add column reference"
git log --oneline
```

- SQL syntax has error. so, switch into `main` branch, any branch we create will clone branch you're on. create 👇

```sh
# we wanna fix that () tabling
git checkout -b fix/create-table-syntax
# add () for table Fn
:'
"create": "CREATE TABLE table_name();",
'
git add . # or git add sql_reference.json
git commit -m "fix: create table syntax"
git checkout main
git merge fix/create-table-syntax
git branch -d fix/create-table-syntax
```

- after fixing that sql syntax switch back to feat/...
- when teams work on a codebase simultaneously, you'll see fixes as this, you O `feat/` created this branch and its commit, and another branch fixed the Fn bug, You need to update thy code, before continuing.

> You can't just merge main branch into this subBranch. You need that bug fix commit to be in the same order here, as on `main`.

- so, we need to `rebase` this branch against `main` to do so.

```sh
git rebase main
# in windows. because I created this project with its git init, inside another git. when I arrived at rebase. it made a conflict. NEVER DO SO.😋🤪
```

- sql file should be:

```json
{
  "database": {
    "create": "CREATE DATABASE database_name;",
    "drop": "DROP DATABASE database_name;"
  },
  "table": {
    "create": "CREATE TABLE table_name();",
    "drop": "DROP TABLE table_name;"
  },
    "column": {
    "add": "ALTER TABLE table_name ADD COLUMN column_name;",
    "drop": "ALTER TABLE table_name DROP COLUMN column_name;"
  }
}

```

- add a `drop` key to the `column` Obj. with syntax of dropping a column, as:

```json
"drop": "ALTER TABLE table_name DROP COLUMN column_name;"
```

- after checking status, and diff. add file to staging area, then commit msg with: `feat: add drop column reference`, then check: `git log --oneline`
- now, switch to `main` branch,

---

- then **pretending you're another coder** create a new branch with `-b` named: `feat/add-insert-row-reference`, then create the following:

```json
,
"row": {
  "insert": "INSERT INTO table_name(columns) VALUES(values);"
}
```

- then check status -> diff -> `add .`, commit with msg: `feat: add insert row reference`
- it's finished, go to `main` branch to be able to merge it.

---

- in `main` branch view branches, then merge it with prior branch: `insert row`. then check the log
- then switch to `feat/add-column.....`, then update this with `rebase`. YOU SHOULD SEE A CONFLICT🥸 finally how to deal with it!🥲

---

The conflict arose because the first commit you added to this branch changed the same lines as the commit from `main`. So it tried to add the commit, but couldn't because something was already there. There are sections, separated by characters (`<`, `>`, and `=`), that represent the commit you are on (`HEAD`) and the commit that is trying to be added (`feat: add column reference`). Fix the conflict by removing those `<`, `>`, and `=` characters. Then making the JSON object valid again.

- this is how the file looks like with nano:

```json
{
  "database": {
    "create": "CREATE DATABASE database_name;",
    "drop":"DROP DATABASE database_name;"
  },
  "table": {
    "create": "CREATE TABLE table_name();",
    "drop":"DROP TABLE table_name;"
  },
<<<<<<< HEAD
  "row": {
    "insert": "INSERT INTO table_name(columns) VALUES(values);"
=======
    "column": {
    "add":"ALTER TABLE table_name ADD COLUMN column_name;"
>>>>>>> 3dc3279 (feat: add column reference)
  }
}

```

- it should become as:

```json
{
  "database": {
    "create": "CREATE DATABASE database_name;",
    "drop": "DROP DATABASE database_name;"
  },
  "table": {
    "create": "CREATE TABLE table_name();",
    "drop": "DROP TABLE table_name;"
  },
  "row": {
    "insert": "INSERT INTO table_name(columns) VALUES(values);"
  },
  "column": {
    "add": "ALTER TABLE table_name ADD COLUMN column_name;"
  }
}

```

- the empty line on bottom is important

check the status

It says that you are still in the middle of rebasing and there's one file that needs to be merged yet. Add the file to staging like you would any other commit.

```sh
# 🔴🔴🔴🔴🔴🔴🔴🔴
git add sql_reference.json
# 🔴🔴🔴🔴🔴🔴🔴🔴
```

- check the status

You fixed the conflicts that arose from trying to add this commit and added them to staging. It says `all conflicts fixed: run "git rebase --continue"`. Run the suggested command to continue the rebase.

1. in my debian it went to commit file, I made a little change in the message to be able to proceed

---

log in oneline

- You can see the `insert row` commit below the head with two commits, it means it's up to date.
- git status, git diff, add file to staging area.
- then commit with: `feat: add rename column reference`

Now, you can see three unique commits to this branch, so we go to `feat/add-insert-row-reference`

- then add this into row key:

```json
"update": "UPDATE table_name SET column_name = new_value WHERE condition;"
```

- There has been a mistake ⚠️mentors say! this branch was for the `insert` command, not the `update` one.

> You can put thy changes aside with `stash`. `git stash`.

- uncommitted changes will disappear from the file.

CHECK STATUS, it'll be clean

> **git stash list** is as its name, appears stash lists

it's an array that starts with {0}
to **bring** the changes **back** use:

```sh
git stash pop
# check if there is a list of stash now
git stash list
# re-put it in the stash
git stash
```

- View a condensed version of the changes in the **latest** stash with `git stash show`.
- View the full changes of the latest stash with `git stash show -p`. `-p` stands for "patch".
- You can add the latest stash while keeping it in the list with `git stash apply`. and it will appear the status.

Now, try stash same stashed again, after it's been applied
it accepts that and there are two indexes now.

- You can use the name at the front of each stash (`stash@{#}`) with many of the stash commands to select one other than the latest one.

> real e.g: **git stash show stash@{1}**

- similarly, to show the full changes of stash@{1} |with patch| do this:

```sh
git stash show -p stash@{1}
```

- There's two identical items in your stash. Drop one of them with `git stash drop` or `git stash drop <stash_name>`.

- as: `git stash drop stash@{1}`, then view the list to check it out

---

- switch to `main` branch. use `checkout`
- delete the `feat/add-insert-row-reference` branch. with `-d`

> `git branch -d feat/add-insert-row-reference`

- create and checkout feat/add-more-row-references
- `git checkout -b feat/add-more-row-references`
- now, pop the stashed changes that are still stashed from the prior branch, with `git stash pop`. the stash will become empty. check it and check diff.
- then add changes to the staging area. `git add .`
- then commit with : `feat: add update row reference`
- then switch to `main` branch, then `git merge feat/add-more-row-references`
- then switch to `feat/add-column-references`, and then `rebase` it against `main` to bring the new commits. You should get a conflict.
- ⚠️ This conflict is a bit trickier. ⚠️
- the whole file should look as:

```json
{
  "database": {
    "create": "CREATE DATABASE database_name;",
    "drop": "DROP DATABASE database_name;"
  },
  "table": {
    "create": "CREATE TABLE table_name();",
    "drop": "DROP TABLE table_name;"
  },
  "row": {
    "insert": "INSERT INTO table_name(columns) VALUES(values);",
    "update": "UPDATE table_name SET column_name = new_value WHERE condition;"
  },
  "column": {
    "add": "ALTER TABLE table_name ADD COLUMN column_name;"
  }
}

```

- now, check the status. It looks like it was the "add column" commit that had the conflict. Add your changes to staging.
- with `git add sql_reference.json`.
- ⚠️continue the rebase statement⚠️ with `git rebase --continue`
- continue in shell without changing! view the log --oneline
- then make column as:

```json
"column": {
  "add": "ALTER TABLE table_name ADD COLUMN column_name;",
  "drop": "ALTER TABLE table_name DROP COLUMN column_name;",
  "rename": "ALTER TABLE table_name RENAME COLUMN column_name TO new_name;",
  "primary_key": "ALTER TABLE table_name ADD PRIMARY KEY(column_name);"
}
```

- then check diff and then add to the staging area, then commit with: `feat: add primary key reference`
- now, add foreign_key into the file -> column key as: `"foreign_key": "ALTER TABLE table_name ADD FOREIGN KEY(column_name) REFERENCES table_name(column_name);"`
- then add to stage. then commit with: `feat: add foreign key reference`

---

- go to the `feat/add-more-row-references` branch
- now add this in the json file:

```json
// in the row Obj:
"delete": "DELETE FROM table_name WHERE condition;"
```

then as in prior steps, check diff, add sql_reference.json ,then commit : `feat: add delete row reference`

- go to `main`, and merge prior branch's stuff. `git merge feat/add-more-row-references`. then delete that merged branch, no need to it. `git branch -d`
- now, practice fixing to forget adding some names!

---

- create and -b this branch: `fix/add-missing-rename-references`.
- create this in json for rename SQL DB name:

```js
// in DB Obj
"rename": "ALTER DATABASE database_name RENAME TO new_name;"
```

- as before, check diff, then set to stage! then commit with: `fix: add missing rename database reference`

---

Now, switch to feat/add.... branch

There was a commit to `main` since you last worked on this from when you merged the "add more row references" branch.

- Rebase this branch against `main` so it's up to date and you can finish working on it.
- THAT'S AN INEVITABLE CONFLICT
- fix it. their hint final json file, is weird as prior ones🥲 they were adding new lines, and now, they remove them!

```json
{
  "database": {
    "create": "CREATE DATABASE database_name;",
    "drop": "DROP DATABASE database_name;"
  },
  "table": {
    "create": "CREATE TABLE table_name();",
    "drop": "DROP TABLE table_name;"
  },
  "row": {
    "insert": "INSERT INTO table_name(columns) VALUES(values);",
    "update": "UPDATE table_name SET column_name = new_value WHERE condition;",
    "delete": "DELETE FROM table_name WHERE condition;"
  },
  "column": {
    "add": "ALTER TABLE table_name ADD COLUMN column_name;"
  }
}

```

- then after checking the chaos, add to stage!
- use `git rebase --continue`

---

- in json file make it as:

```json
{
  "database": {
    "create": "CREATE DATABASE database_name;",
    "drop": "DROP DATABASE database_name;"
  },
  "table": {
    "create": "CREATE TABLE table_name();",
    "drop": "DROP TABLE table_name;"
  },
  "row": {
    "insert": "INSERT INTO table_name(columns) VALUES(values);",
    "update": "UPDATE table_name SET column_name = new_value WHERE condition;",
    "delete": "DELETE FROM table_name WHERE condition;"
  },
  "column": {
    "add": "ALTER TABLE table_name ADD COLUMN column_name;",
    "drop": "ALTER TABLE table_name DROP COLUMN column_name;",
    "rename": "ALTER TABLE table_name RENAME COLUMN column_name TO new_name;",
    "primary_key": "ALTER TABLE table_name ADD PRIMARY KEY(column_name);",
    "foreign_key": "ALTER TABLE table_name ADD FOREIGN KEY(column_name) REFERENCES table_name(column_name);",
    "unique": "ALTER TABLE table_name ADD UNIQUE(column_name);"
  }
}

```

- then add . ; then commit with: `"feat: add unique reference"`

> To reset a commit that was mistakenly added You have few ways:

You can use the `git reset` command to travel to any point in your commit history.

- do it with the HEAD, as: `git reset HEAD~1`
- it put undid working in the working tree!
- check its info with log --oneline, IT'S GONE
- check status, diff.

> If you used the `--hard` flag with the reset, the changes would have not been added to the working tree and if you used the `--soft` flag, the changes would have been added to the working tree and to staging.

now add them: `git add .`, then commit with: `feat: add unique reference`

Reverting is a good way to undo a commit because you don't lose the commit from the history. You can revert the most recent commit (`HEAD`) with `git revert HEAD`. Do that now.

> **git revert HEAD**

In nano mentors say: you can exit without the need of using write out command:`ctrl + O`, using by using Exit command: `ctrl + X`

view the **log -oneline**

Using revert to undo that commit added another commit that is the exact opposite of it. Enter `git show` into the terminal to see the last commit added (now `HEAD`) and its details.

- Type `git show HEAD~1` to take a look at the details of the original commit that you reverted.

If you look at the bottom of those two messages, it shows the diff. The diff of the revert commit is the exact opposite of the one before it. Effectively, undoing the changes. You've used rebase to update this branch, but you can enter an "interactive" mode to manipulate commits. Type `git rebase --interactive HEAD~2` into the terminal to enter this mode. The `HEAD~2` means you will have a chance to change the last two commits.

in linux it'll open nano, in vscode it opened GitLens Interactive Rebase.

At the top of Nano, you can see the two commits with `pick` next to them. Below them, there's a list of options for working with them. `pick` means that it will use the commits as they were. At the bottom, it says, `d, drop = remove commit`. Replace the word `pick` preceeding your two commits with a `d` to drop them both. When you are done, save the file and exit Nano.

this is how nano file looks like:

```sh
pick e8787ad feat: add unique reference
pick 1ba9396 Revert "feat: add unique reference"

# Rebase 458f473..1ba9396 onto 458f473 (2 commands)
#
# Commands:
# p, pick <commit> = use commit
# r, reword <commit> = use commit, but edit the commit message
# e, edit <commit> = use commit, but stop for amending
# s, squash <commit> = use commit, but meld into previous commit
# f, fixup [-C | -c] <commit> = like "squash" but keep only the previous
#                    commit's log message, unless -C is used, in which case
#                    keep only this commit's message; -c is same as -C but
#                    opens the editor
# x, exec <command> = run command (the rest of the line) using shell
# b, break = stop here (continue rebase later with 'git rebase --continue')
# d, drop <commit> = remove commit
# l, label <label> = label current HEAD with a name
# t, reset <label> = reset HEAD to a label
# m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
#         create a merge commit using the original merge commit's
#         message (or the oneline, if no original merge commit was
#         specified); use -c <commit> to reword the commit message
# u, update-ref <ref> = track a placeholder for the <ref> to be updated
#                       to this position in the new commits. The <ref> is
#                       updated at the end of the rebase
#
# These lines can be re-ordered; they are executed from top to bottom.
#
# If you remove a line here THAT COMMIT WILL BE LOST.
#
# However, if you remove everything, the rebase will be aborted.
#
```

- then check the history with oneline.
- Enter another `--interactive` rebase that goes back to the `--root` instead of `HEAD~2`. it means the initial commit:

> git rebase --interactive --root

Now, you see the latest at the bottom, and all commits are appearing.

One of the options is: `# r, reword <commit> = use commit, but edit the commit message` replace the initial commit's flag: `pick` with an `r`, then exit!

Git will put you in another Nano instance to reword the commit message. Don't change anything in it yet.

⚠️ There is a problem: each time we reword the commit, its **commit hash** changes! ⚠️
And when **rebasing interactively** it changes all hashes!
If you were to try and merge this into `main`, it wouldn't work because they don't share the same history anymore.

So, for this reason, **DON'T DO AN INTERACTIVE REBASE!** where you go back passed commits unique to the branch you are on.

> To fix this Enter: **git rebase main**

view the log with oneLine, *a CONFLICT happened to one commit*
Go back to the first commit you added to this branch, it's `HEAD~5`. Use: `git rebase --interactive HEAD~5`

conflict in the lesson, whatever :O( I played around with --continue and did something similar! 😎

Squashing commits means that you will take a bunch of commits and turn them into one. This is helpful to keep your commit history clean and something you want try to do. Replace `pick` with an `s` next to all your commits except the one with the message `feat: add column references`. When you are done, save and exit the file. You will find yourself in another instance of Nano. Don't change anything in it yet.

Merge feat/... into it. and remove prior one. check the recent log with `git log -1`

Go to fix/add-missing-rename-references branch
Update it with rebase

You can view the last `x` number of commits with any number instead of `1`. View the last five commits with the oneline flag. as: `git log -5 --oneline`

it's up to date, add this to table Obj:

```json
,
  "rename": "ALTER TABLE table_name RENAME TO new_name;"
```

The whole json file should be as:

```json
{
  "database": {
    "create": "CREATE DATABASE database_name;",
    "drop": "DROP DATABASE database_name;",
    "rename": "ALTER DATABASE database_name RENAME TO new_name;"
  },
  "table": {
    "create": "CREATE TABLE table_name();",
    "drop": "DROP TABLE table_name;",
    "rename": "ALTER TABLE table_name RENAME TO new_name;"
  },
  "row": {
    "insert": "INSERT INTO table_name(columns) VALUES(values);",
    "update": "UPDATE table_name SET column_name = new_value WHERE condition;",
    "delete": "DELETE FROM table_name WHERE condition;"
  },
  "column": {
    "add": "ALTER TABLE table_name ADD COLUMN column_name;",
    "drop": "ALTER TABLE table_name DROP COLUMN column_name;",
    "rename": "ALTER TABLE table_name RENAME COLUMN column_name TO new_name;",
    "primary_key": "ALTER TABLE table_name ADD PRIMARY KEY(column_name);",
    "foreign_key": "ALTER TABLE table_name ADD FOREIGN KEY(column_name) REFERENCES table_name(column_name);"
  }
}

```

check diff, status, then add to stage!
commit with: `fix: add missing rename table reference`
view last 5 logs with oneline: `git log --oneline -5`

we have two commits on this branch:

```git
357e0cd (HEAD) fix: add missing rename table reference
399fd1e (bader) feat: add update row reference
f268958 fix: create table syntax
dd7b3d0 feat: add drop table reference
cef2371 feat: add create table reference
```

that could be squashed with: `git rebase --interactive HEAD~2`, then put `s` instead of `pick`.

there are some bugs with the project!
go to 3129 in TUTORIAL.md

let's continue in 3218! make the only existing commit the main one

---

That's a nice looking commit history. There's one more thing you should learn. Create and checkout a branch named `feat/add-gitignore`.

create the `.env` in the repo, in terminal: `touch .env`

Now, create `.gitignore` file.

they wanna ignore .env as you practiced and did million times in express projects, by putting file/DIR names inside

after hiding secrets, add . then commit with: `feat: add .gitignore`

now create sample.env, then add the variable name only to help others recognize its names: `SECRET=`

then add it, them commit with: `feat: add sample.env`

then check last 5 logs: `git log -5 --oneline`

The two commits you made to this branch can be squashed. Do an interactive rebase that goes back to all the commits unique to this branch (`HEAD~2`).

when in git messaging add: `feat: add .gitignore and sample.env`

> ⚠️my mistakes were because of making all commits as `s`⚠️ one should be as `r` reword, to be able to put the next commit msg!

switch to main branch, then merge as you're on main, then delete prior one

check `git log --oneline`, then without that flag

> THAT'S THE ONLY USEFUL THING OF ALL OF THIS SUFFER! 🥵

FINALLY, FINAAAAAAAAAAAAAAAAAAAAAAALY

FINISHED IT AT: **5:42 PM 9/3/2023**

---
---
---

## 13. Periodic Table Database

This is one of the required projects to earn your certification. For this project, you will create Bash a script to get information about chemical elements from a periodic table database.

solution:

### Part 1: Fix the database

```sql
-- psql --username=freecodecamp --dbname=periodic_table

-- You should rename the weight column to atomic_mass
ALTER TABLE properties RENAME COLUMN weight TO atomic_mass;

-- You should rename the `melting_point` column to `melting_point_celsius` and the `boiling_point` column to `boiling_point_celsius`
ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;
-- in sql it can do many, but in psql it can't
ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;

-- Your `melting_point_celsius` and `boiling_point_celsius` columns should not accept null values
ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;
ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;

-- You should add the `UNIQUE` constraint to the `symbol` and `name` columns from the `elements` table
ALTER TABLE elements ADD UNIQUE(symbol);
ALTER TABLE elements ADD UNIQUE(name);

-- Your `symbol` and `name` columns should have the `NOT NULL` constraint
ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;
ALTER TABLE elements ALTER COLUMN name SET NOT NULL;

-- You should set the `atomic_number` column from the `properties` table as a foreign key that references the column of the same name in the `elements` table
ALTER TABLE properties ADD FOREIGN KEY(atomic_number) REFERENCES elements(atomic_number);

-- You should create a `types` table that will store the three types of elements
CREATE TABLE types();

-- Your `types` table should have a `type_id` column that is an integer and the primary key
ALTER TABLE types ADD COLUMN type_id INT PRIMARY KEY;

-- Your `types` table should have a `type` column that's a `VARCHAR` and cannot be `null`. It will store the different types from the `type` column in the properties table
ALTER TABLE types ADD COLUMN type VARCHAR(25) NOT NULL;

-- You should add three rows to your `types` table whose values are the three different types from the `properties` table
-- To get them I used: select distinct(type) from properties;
-- now I create a sequence and set it to nextval of type_id to increment automatically
CREATE SEQUENCE types_type_id_seq;
ALTER TABLE types ALTER COLUMN type_id SET DEFAULT nextval('types_type_id_seq');
ALTER SEQUENCE types_type_id_seq OWNED BY types.type_id;
-- now this is gonna work! 👇
INSERT INTO types(type) VALUES('metal'),
('metalloid'),
('nonmetal');

-- Your `properties` table should have a `type_id` foreign key column that references the `type_id` column from the `types` table. It should be an `INT` with the `NOT NULL` constraint
ALTER TABLE properties ADD COLUMN type_id INT, ADD FOREIGN KEY (type_id) REFERENCES types (type_id);
```

Now, I'll add these three with scripting:🤯 isn't it

```sh
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
```

I put it in `type_id_looping.sh` file.

- then make them not null, and continue

```sql
ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;
-- Each row in your `properties` table should have a `type_id` value that links to the correct type from the `types` table; ✅ with prior steps
```

- You should capitalize the first letter of all the `symbol` values in the `elements` table. Be careful to only capitalize the letter and not change any others; I'll create another shell file for it `capitalize_symbol.sh`

```sh
#!/bin/bash

PSQL="psql -U freecodecamp -d periodic_table -t -A -c"

SYMBOL_ROWS=$($PSQL "SELECT symbol FROM elements")
while IFS='|' read -r ORIGINAL; do
  MODIFIED=$(echo "$ORIGINAL" | awk '{ print toupper(substr($0, 1, 1)) substr($0, 2) }')
  $PSQL "UPDATE elements SET symbol = '$MODIFIED' WHERE symbol = '$ORIGINAL'"
done <<< "$SYMBOL_ROWS"
```

- You should remove all the trailing zeros after the decimals from each row of the `atomic_mass` column. You may need to adjust a data type to `DECIMAL` for this. The final values they should be are in the `atomic_mass.txt` file.

```SQL
-- initially, there are 2 trailing decimals in all, so change its 6 into 4
ALTER TABLE properties ALTER COLUMN atomic_mass TYPE numeric(9,4);
-- then remove the trailing with less than that
-- ⚠️🔴⚠️🔴 didn't work yet!


-- You should add the element with atomic number `9` to your database. Its name is `Fluorine`, symbol is `F`, mass is `18.998`, melting point is `-220`, boiling point is `-188.1`, and it's a `nonmetal`
insert into elements(atomic_number, symbol, name) values(9, 'F', 'Fluorine') -- connect other tables with it to be able to add the rest
```

-

### Part 2: Create your git repository

Hi

### Part 3: Create the script

Hi

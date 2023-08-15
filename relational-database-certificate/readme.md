# this course is built of 14 section

- It starts from building a boilerplate website by bash. [see the curriculum](https://www.freecodecamp.org/learn/relational-database/#learn-git-by-building-an-sql-reference-object)
- 1. Learn Bash by Building a Boilerplate
- 2. Learn Relational Databases by Building a Mario Database
- 3. Celestial Bodies Database
- 4. Learn Bash Scripting by Building Five Programs
- 5. Learn SQL by Building a Student Database: Part 1
- 6. Learn SQL by Building a Student Database: Part 2
- 7. World Cup Database
- 8. Learn Advanced Bash by Building a Kitty Ipsum Translator
- 9. Learn Bash and SQL by Building a Bike Rental Shop
- 10. Salon Appointment Scheduler
- 11. Learn Nano by Building a Castle
- 12. Learn Git by Building an SQL Reference Object
- 13. Periodic Table Database
- 14. Number Guessing Game

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
- and use: `help test`. it's good for same topic
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

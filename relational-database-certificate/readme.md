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

- 
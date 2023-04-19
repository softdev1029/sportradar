# sportradar

Coding challenge - check more detail https://github.com/sportradarus/sportradar-advanced-challenge

This program is based node.js+mysql.
You can execute this program in many ways.
All instructions below must be executed within this registry cloned from GitHub.

## file structure

```
: config.js - configuration file such as database configuration
: database.js - all database functions such as connect/disconnect, CRUD operations
: index.js - the main module running the 1st process (continually watch for game status changes and toggle the next process on game status changes)
: worker.js - the module running the 2nd process (run when games are live and close when games are over. This process will ingest game data from the NHL)
: nhlapi.js - the API integration
```

## Docker

If you know docker, then docker and docker-compose will be in your environment.
This program support docker-compose.

`docker-compose -f docker-compose.yaml up`

If you face the following error, please use `version: '2.2'` or a proper version instead of 1.0.

```
ERROR: Version in "./docker-compose.yaml" is invalid. You might be seeing this error because you're using the wrong Compose file version. Either specify a supported version (e.g "2.2" or "3.3") and place your service definitions under the `services` key, or omit the `version` key and place your service definitions at the root of the file to use version 1.
```

If you face the mysql port conflict issue, please use other port instead of the default 3306.

```
Error starting userland proxy: listen tcp4 0.0.0.0:3306: bind: address already in use
```

As you know, if docker-compose is successful, then you can go into the docker shell and get your needs.

![image](https://user-images.githubusercontent.com/43288800/232275073-079c5fe9-a28d-46ed-bcea-f47022add61a.png)

## Manual Setup

This can be a bit complicated if you want to install it manually.
But if you're an expert, you won't have a problem.

### setup mysql

- install mysql

`sudo apt install mysql-server`

- create database and user for this program

Go to mysql shell and do the following.

`CREATE DATABASE sportradar;`

`CREATE USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'password';`

`GRANT ALL PRIVILEGES ON sportradar.* TO 'root'@'%';;`

Now, you can import init seed sql to your database.

`mysql -u root -ppassword sportradar < init_seed.sql`

### setup program

If you successfully install and setup mysql, then you can run this program.
Please do the following.

`npm install`

`npm start`

Now you can get sportradar-advanced-challenge data.

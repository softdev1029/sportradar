# sportradar

Coding challenge - check more detail https://github.com/sportradarus/sportradar-advanced-challenge

This program is based node.js+mysql.
You can execute this program in many ways.
All instructions below must be executed within this registry cloned from GitHub.

## 1. Docker
If you know docker, then docker and docker-composer will be in your environment.
This program support docker-compose.

`docker-compose -f docker-compose.yaml up`

As you know, if docker-compose is successful, then you can go into the docker shell and get your needs.

![image](https://user-images.githubusercontent.com/43288800/232275073-079c5fe9-a28d-46ed-bcea-f47022add61a.png)

## 2. Manually
This can be a bit complicated if you want to install it manually.
But if you're an expert, you won't have a problem.


### setup mysql
- install mysql
`sudo apt install mysql-server`
- create database and user for this program
Go to mysql shell and do the following.
`CREATE DATABASE sportradar;`
`CREATE USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'password';`
`GRANT PRIVILEGE ON sportradar.% TO 'root'@'%';`
Now, you can import init seed sql to your database.
`mysql -u root -ppassword sportradar < init_seed.sql`

### setup program
If you successfully install and setup mysql, then you can run this program.
Please do the following.
`npm install`
`npm start`

Now you can get NHL data.

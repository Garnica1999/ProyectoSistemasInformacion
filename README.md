# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: ruby 2.3.3p222 or later

* System dependencies: This project depends on rails, and postgres and sqlite3 gems to work correctly. It is recommended to install the most available version of rails.

* Configuration: 
Step 1: It is recommended first to download to install ruby ​​on the machine / server to run the project. version 2.3.3p222 or higher is recommended.
Step 2: After downloading ruby, you can open the version with the command 'ruby -v'. Later you can proceed to install rails with the command 'gem install rails'. Once installed you can watch its version with the command rails --version
Step 3: Now you can download the project, you can save it in a folder. In the terminal or shell, you can go to the folder until you are inside the project folder. Once here execute the command 'bundle install'. This allows you to install all the gems necessary for the project. Once finished, if you want to start the project without data, you need to execute a series of commands, which are: 'rake db: drop: _unsafe', then 'rake db: create', then 'rake db: migrate'. If you want to keep the data, do not enter the data before the console. In case you have entered the previous commands to the shell, you must load the fixed data to the database, these are data tests, and they are used in the development and testing environment. For this, go to the project folder, then to db, and then open the seeds.rb file. In this file you will find all the data that will be entered into the database.

You can not upload all the data. For this, just copy the first 7 lines of this file, go to the shell and enter the command 'rails console', after this paste the bottom data, this will create data within the schools table.

Step 4: In your shell type exit, and then the command 'rails server'. This will start the server in the link http: // localhost: 3000. This link enter it in the browser of your confidence.

From here, you can create with rails console, the data of all the tables in the database.

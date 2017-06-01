# Recipes

A trendy web app made in Ruby and Sinatra which allows you add, edit and delete recipes from your collection. 

The recipes and ingredients are persisted in a PostGres SQL database. 

You can also search by ingredient and see all of the recipes which use that item. 

## Mac/Linux Installation

1. Clone the repository into your desired location.
2. Install and set up postgres if you haven't already got it. 
3. Connect to postgres with `psql -u postgres -h localhost -p 5432`
4. Create a database `CREATE DATABASE recipe_tracker`
5. `\l` to list databases and check it was created. `\q` to quit postgres.
6. Open sqlrunner.rb and edit the PG.connect hash with the login details of your own Postgres database.
7. Install dependencies in the command line using sudo if on linux, `gem install pry`, `gem install pry-byebug`, `gem install sinatra`, `gem install sinatra-contrib`, `gem install pg -v 0.20.0`
8. cd into db folder. 
9. Create the required tables in the database by running the sql file. `psql -p 5432 -U postgres -h localhost -d recipe_tracker -a -f recipe_tracker.sql`
10. Seed the database, `ruby seed.rb`
11. cd back into recipes.
12. Start the server `ruby app.rb`
13. Use your browser to navigate to localhost:4567
14. Enjoy!
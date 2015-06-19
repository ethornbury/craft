# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# this is the default user admin account 
User.create!(email: "admin@email.com",
             admin: true,
             password: "password")

#this is the default employee admin account that goes with the user one above              
Employee.create!(firstname:  "Admin",
              lastname: "User",
              email: "admin@email.com",
              admin: true,
              user_id: 1)
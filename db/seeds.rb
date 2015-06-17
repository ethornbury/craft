# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create!(email: "admin@email.com",
             admin: true,
             password: "password")
              
Employee.create!(firstname:  "Admin",
              lastname: "User",
              email: "admin@email.com",
              admin: true,
              user_id: 1)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  User.create(name:'BingChenL', email:'123@gmail.com', password: "secret", password_confirmation: "secret")
  User.create(name:'bingchenl', email:'1234@gmail.com', password: "secret", password_confirmation: "secret")
  User.create(name:'HarryPotter', email:'12345@gmail.com', password: "secret", password_confirmation: "secret")

    user = User.find(1)
    user.microposts.create(content: "I love Ruby")
    user.microposts.create(content: "I love rails")
    user = User.find(2)
    user.microposts.create(content: "I love Java")
    user = User.find(3)
    user.microposts.create(content: "I love programming")
   
    Football = InterestTag.create(name: 'Football')
    Music = InterestTag.create(name: 'Music')
   


    User.find(1).interest_tags<<Football
    user.find(2).interest_tags<<Music

    Waterford=Location.create(address:'Wateford')
    Cork=Location.create(address:'Cork')
    Dublin=Location.create(address:"Dublin")
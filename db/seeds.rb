# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
   User.create(name:'Bing Chen L', email:'123@gmail.com', password: "secret", password_confirmation: "secret")
  User.create(name:'bing chen l', email:'1234@gmail.com', password: "secret", password_confirmation: "secret")
  User.create(name:'Harry Potter', email:'12345@gmail.com', password: "secret", password_confirmation: "secret")

    user = User.find(1)
    user.microposts.create(content: "I love Ruby")
    user.microposts.create(content: "I love rails")
    user = User.find(2)
    user.microposts.create(content: "I love Java")
    user = User.find(3)
    user.microposts.create(content: "I love programming")

   
    Football = InterestTag.create(name: 'Football')
    Music = InterestTag.create(name: 'Music')
    Painting=InterestTag.create(name: 'Painting')
   


    User.find(1).interest_tags<<Football
    User.find(2).interest_tags<<Music
     User.find(3).interest_tags<<Painting

    Waterford=Location.create(address:'Wateford')
    Cork=Location.create(address:'Cork')
    Dublin=Location.create(address:"Dublin")


    user = User.find(1)
    comment = Comment.new(:content => "nice post")
    comment.user = user
    comment.micropost = Micropost.find(1)
    comment.save

    comment = Comment.new(:content => "nice world")
    comment.user = user
    comment.micropost = Micropost.find(2)
    comment.save

    comment = Comment.new(:content => "nice blabla")
    comment.user = User.find(2)
    comment.micropost = Micropost.find(2)
    comment.save
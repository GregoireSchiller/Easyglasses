# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "date"

Review.destroy_all
UserAnswer.destroy_all
Exam.destroy_all
Question.destroy_all
User.destroy_all

user1 = User.create( date_of_birth: Date.new(1988,1,11), first_name: "Gregoire", last_name: "Schiller", city: "Paris", email: "test@test.com", password: "testtest")
Review.create( rating: 3, description: "average", user: user1)
Question.create( position: 1, orientation: rand(1..4), size: 700)
Question.create( position: 2, orientation: rand(1..4), size: 350)
Question.create( position: 3, orientation: rand(1..4), size: 180)
Question.create( position: 4, orientation: rand(1..4), size: 180)
Question.create( position: 5, orientation: rand(1..4), size: 90)
Question.create( position: 6, orientation: rand(1..4), size: 90)
Question.create( position: 7, orientation: rand(1..4), size: 45)
Question.create( position: 8, orientation: rand(1..4), size: 45)
Question.create( position: 9, orientation: rand(1..4), size: 20)
Question.create( position: 10, orientation: rand(1..4), size: 20)
Question.create( position: 11, orientation: rand(1..4), size: 700)
Question.create( position: 12, orientation: rand(1..4), size: 350)
Question.create( position: 13, orientation: rand(1..4), size: 180)
Question.create( position: 14, orientation: rand(1..4), size: 180)
Question.create( position: 15, orientation: rand(1..4), size: 90)
Question.create( position: 16, orientation: rand(1..4), size: 90)
Question.create( position: 17, orientation: rand(1..4), size: 45)
Question.create( position: 18, orientation: rand(1..4), size: 45)
Question.create( position: 19, orientation: rand(1..4), size: 20)
Question.create( position: 20, orientation: rand(1..4), size: 20)
exam1 = Exam.create( exam_date: Date.today, user: user1)

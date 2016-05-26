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
question1 = Question.create( position: 1, orientation: 1, size: 1)
Question.create( position: 1, orientation: 1, size: 5)
Question.create( position: 2, orientation: 2, size: 5)
Question.create( position: 3, orientation: 3, size: 5)
Question.create( position: 4, orientation: 4, size: 5)
Question.create( position: 5, orientation: 1, size: 4)
Question.create( position: 6, orientation: 2, size: 4)
Question.create( position: 7, orientation: 3, size: 4)
Question.create( position: 8, orientation: 4, size: 4)
Question.create( position: 9, orientation: 1, size: 3)
Question.create( position: 10, orientation: 2, size: 3)
Question.create( position: 11, orientation: 3, size: 3)
Question.create( position: 12, orientation: 4, size: 3)
Question.create( position: 13, orientation: 1, size: 2)
Question.create( position: 14, orientation: 2, size: 2)
Question.create( position: 15, orientation: 3, size: 2)
Question.create( position: 16, orientation: 4, size: 2)
Question.create( position: 17, orientation: 1, size: 1)
Question.create( position: 18, orientation: 2, size: 1)
Question.create( position: 19, orientation: 3, size: 1)
Question.create( position: 20, orientation: 4, size: 1)
exam1 = Exam.create( exam_date: Date.today, user: user1)

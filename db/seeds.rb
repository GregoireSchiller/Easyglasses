# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "date"

Review.destroy_all
User.destroy_all
Exam.destroy_all
Question.destroy_all
UserAnswer.destroy_all

user1 = User.create( date_of_birth: Date.new(1988,1,11), first_name: "Gregoire", last_name: "Schiller", city: "Paris", email: "test@test.com", password: "testtest")
Review.create( rating: 3, description: "average", user: user1)
question1 = Question.create( position: 1, orientation: 1, size: 1)
exam1 = Exam.create( exam_date: Date.today, user: user1)
UserAnswer.create( question: question1, exam: exam1, answered_orientation: 1)

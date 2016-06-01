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
Prescription.destroy_all
Exam.destroy_all
Question.destroy_all
User.destroy_all

patient1 = User.create(date_of_birth: Date.new(1988,1,11), first_name: "Grégoire", last_name: "Schiller", city: "Paris", email: "test1@test.com", password: "testtest", ophtalmo: false)
patient2 = User.create(date_of_birth: Date.new(1988,1,11), first_name: "Grégoire", last_name: "Bolloré", city: "Paris", email: "test2@test.com", password: "testtest", ophtalmo: false)
patient3 = User.create(date_of_birth: Date.new(1988,1,11), first_name: "Édouard", last_name: "de Nettancourt", city: "Paris", email: "test3@test.com", password: "testtest", ophtalmo: false)
patient4 = User.create(date_of_birth: Date.new(1988,1,11), first_name: "Benjamin", last_name: "Meuleman", city: "Paris", email: "test4@test.com", password: "testtest", ophtalmo: false)
ophtalmo1 = User.create(date_of_birth: Date.new(1988,1,11), first_name: "Boris", last_name: "Paillard", city: "Paris", email: "test5@test.com", password: "testtest", ophtalmo: true)
# ophtalmo2 = User.create(date_of_birth: Date.new(1988,1,11), first_name: "Romain", last_name: "Paillard", city: "Paris", email: "test6@test.com", password: "testtest", ophtalmo: true)
Review.create(rating: 3, description: "average", patient: patient1)
Question.create(position: 1, orientation: rand(1..4), size: 350)
Question.create(position: 2, orientation: rand(1..4), size: 180)
Question.create(position: 3, orientation: rand(1..4), size: 90)
Question.create(position: 4, orientation: rand(1..4), size: 45)
Question.create(position: 5, orientation: rand(1..4), size: 20)
Question.create(position: 6, orientation: rand(1..4), size: 90)
Question.create(position: 7, orientation: rand(1..4), size: 45)
Question.create(position: 8, orientation: rand(1..4), size: 45)
Question.create(position: 9, orientation: rand(1..4), size: 20)
Question.create(position: 10, orientation: rand(1..4), size: 20)
Question.create(position: 11, orientation: rand(1..4), size: 350)
Question.create(position: 12, orientation: rand(1..4), size: 180)
Question.create(position: 13, orientation: rand(1..4), size: 90)
Question.create(position: 14, orientation: rand(1..4), size: 45)
Question.create(position: 15, orientation: rand(1..4), size: 20)
Question.create(position: 16, orientation: rand(1..4), size: 90)
Question.create(position: 17, orientation: rand(1..4), size: 45)
Question.create(position: 18, orientation: rand(1..4), size: 45)
Question.create(position: 19, orientation: rand(1..4), size: 20)
Question.create(position: 20, orientation: rand(1..4), size: 20)
exam11 = Exam.create(exam_date: Date.today - 3, patient: patient1)
prescription11 = Prescription.create(description: "blablabla")
prescription11.exam = exam11
prescription11.ophtalmo = ophtalmo1
prescription11.save
exam11.save
exam13 = Exam.create(exam_date: Date.today - 2, patient: patient3)
prescription13 = Prescription.create(description: "blablabla")
prescription13.exam = exam13
prescription13.ophtalmo = ophtalmo1
prescription13.save
exam13.save
exam14 = Exam.create(exam_date: Date.today, patient: patient4)
prescription14 = Prescription.create(description: "blablabla")
prescription14.exam = exam14
prescription14.ophtalmo = ophtalmo1
prescription14.save
exam14.save
# exam22 = Exam.create(exam_date: Date.today - 7, patient: patient2)
# prescription22 = Prescription.create(description: "blablabla")
# prescription22.exam = exam22
# prescription22.ophtalmo = ophtalmo2
# prescription22.save
# exam22.save
# exam23 = Exam.create(exam_date: Date.today - 5, patient: patient3)
# prescription23 = Prescription.create(description: "blablabla")
# prescription23.exam = exam23
# prescription23.ophtalmo = ophtalmo2
# prescription23.save
# exam23.save
# exam24 = Exam.create(exam_date: Date.today, patient: patient4)
# prescription24 = Prescription.create(description: "blablabla")
# prescription24.exam = exam24
# prescription24.ophtalmo = ophtalmo2
# prescription24.save
# exam24.save

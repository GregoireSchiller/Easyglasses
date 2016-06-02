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

patient1 = User.create(date_of_birth: Date.new(1988,1,11), first_name: "Grégoire", last_name: "Schiller", city: "Paris", email: "gregoire.schiller@gmail.com", password: "testtest", ophtalmo: false)
patient2 = User.create(date_of_birth: Date.new(1988,1,11), first_name: "Grégoire", last_name: "Bolloré", city: "Paris", email: "test2@test.com", password: "testtest", ophtalmo: false)
patient3 = User.create(date_of_birth: Date.new(1988,1,11), first_name: "Édouard", last_name: "de Nettancourt", city: "Paris", email: "test3@test.com", password: "testtest", ophtalmo: false)
patient4 = User.create(date_of_birth: Date.new(1988,1,11), first_name: "Benjamin", last_name: "Meuleman", city: "Paris", email: "benjamin.meuleman@gmail.com", password: "testtest", ophtalmo: false)
ophtalmo1 = User.create(date_of_birth: Date.new(1988,1,11), first_name: "Boris", last_name: "Paillard", city: "Paris", email: "boris.ophtalmo@easyglasses.io", password: "testtest", ophtalmo: true, phone_number: 664865754)
# ophtalmo2 = User.create(date_of_birth: Date.new(1988,1,11), first_name: "Romain", last_name: "Paillard", city: "Paris", email: "test6@test.com", password: "testtest", ophtalmo: true)
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

exam11 = Exam.create(exam_date: Date.today - 540, patient: patient1)
exam11.score_right = 9
exam11.score_left = 9
exam11.score_total = 18
prescription11 = Prescription.create(description: "You don't need glasses for the moment. Don't hesitate to do the test again within 1 year to make sure your view is stable.")
prescription11.exam = exam11
prescription11.ophtalmo = ophtalmo1
prescription11.status = 'Sent'
prescription11.save
exam11.save

exam13 = Exam.create(exam_date: Date.today - 180, patient: patient1)
exam13.score_right = 7
exam13.score_left = 9
exam13.score_total = 16
prescription13 = Prescription.create(description: "Your right eye view is declining. You still don't need glasses but please do the test again within 6 months to see whether you need glasses.")
prescription13.exam = exam13
prescription13.ophtalmo = ophtalmo1
prescription13.status = 'Sent'
prescription13.save
exam13.save

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

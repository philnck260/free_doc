# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Appointment.destroy_all
Doctor.destroy_all
Patient.destroy_all
City.destroy_all

3.times do
	city = City.create(name: Faker::Address.city)
end

50.times do
	patient = Patient.create(first_name: Faker::Name.first_name ,last_name: Faker::Name.last_name, city: City.all[rand(0..2)])
end

20.times do
	doctor = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip_code, city: City.all[rand(0..2)])
end

100.times do
	appointment = Appointment.create(date: Faker::Date.forward(days: 60), doctor: Doctor.all[rand(0..19)], patient: Patient.all[rand(0..49)], city: City.all[rand(0..2)])
end

30.times do
	doctor_specialty = DoctorSpecialty.create(doctor: Doctor.all[rand(0..19)], specialty: Specialty.all[rand(0..12)])
end

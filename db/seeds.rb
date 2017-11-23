require_relative('../models/student')
require_relative('../models/house')

gryffindor = House.new({"house_name" => "Gryffindor"})
ravenclaw = House.new({"house_name" => "Ravenclaw"})
hufflepuff = House.new({"house_name" => "Hufflepuff"})
slytherin = House.new({"house_name" => "Slytherin"})

gryffindor.save
ravenclaw.save
hufflepuff.save
slytherin.save

student1 = Student.new({
  "first_name" => "Harry",
  "surname" => "Potter",
  "house_id" => gryffindor.id,
})

student2 = Student.new({
  "first_name" => "Draco",
  "surname" => "Malfoy",
  "house_id" => slytherin.id,
})

student3 = Student.new({
  "first_name" => "Cho",
  "surname" => "Chang",
  "house_id" => ravenclaw.id,
})

student4 = Student.new({
  "first_name" => "Cedric",
  "surname" => "Diggory",
  "house_id" => hufflepuff.id,
})

student1.save
student2.save
student3.save
student4.save

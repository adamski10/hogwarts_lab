require_relative('../models/student.rb')
require_relative('../models/house.rb')
require('pry')

gryffindor = House.new({
  "name" => "Gryffindor"
})

ravenclaw = House.new({
  "name" => "Ravenclaw"
})

hufflepuff = House.new({
  "name" => "Hufflepuff"
})

slytherin = House.new({
  "name" => "Slytherin"
})

gryffindor.save()
slytherin.save()
ravenclaw.save()
hufflepuff.save()

student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house_id" => 1,
  "age" => 11
})

student2 = Student.new({
  "first_name" => "Ron",
  "last_name" => "Weasley",
  "house_id" => 1,
  "age" => 12
})



student1.save()
student2.save()

binding.pry
nil
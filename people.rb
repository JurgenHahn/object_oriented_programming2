class Person

  def initialize(name)
    @name = name
  end

  def greeting
    puts "Hi, may name is #{@name}."
  end

end


class Student < Person
  #learning is a method available only to students
  def learn
    puts "I get it!"
  end

end

class Instructor < Person
  #teach is a method only available to instructors
  def teach
    puts "Everything in Ruby is an Object."
  end

end

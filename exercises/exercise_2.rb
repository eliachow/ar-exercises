require_relative '../setup'
require_relative './exercise_1'

puts "Exercise 2"
puts "----------"

# Your code goes here ...
@store1 = Store.find(1)
puts "👉👉👉 @store1: #{@store1.name}"

@store2 = Store.second
puts "👉👉👉 @store2: #{@store2.name}"

@store1.name = 'Mount Pleasant'
@store1.save
puts "👉👉👉 @store1: #{@store1.name}"

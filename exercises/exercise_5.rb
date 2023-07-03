require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

# Your code goes here ...
@company = Store.all

revenue_array = []
@company.each do |store|
  revenue_array << store.annual_revenue
end

puts "👉👉👉 Total Company Revenue: $#{revenue_array.sum}"
puts "👉👉👉 Average Company Revenue: $#{revenue_array.sum / revenue_array.count}"

@stores_over_1M = Store.where("annual_revenue >= ? ", 1000000).size

puts "Numbers of stores with annual sales over 1M: #{@stores_over_1M}"
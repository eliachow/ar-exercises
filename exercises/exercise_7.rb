require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
class Employee < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
  validates :store, presence: true
end

class Store < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }
  validates :annual_revenue, numericality: { 
    only_integer: true, greater_than_or_equal_to: 0}
  validate :must_carry_apparel

  def must_carry_apparel
    if !mens_apparel? && !womens_apparel?
      errors.add(:base, "must carry at least one of men's or women's apparel")
    end
  end
end

puts "what is the store name?"
store_name = gets.chomp
store = Store.new(name: store_name)
if store.save
  puts "Store created successfully!"
else
  puts "Errors occurred while creating the store:"
  store.errors.full_messages.each do |message|
    puts message
  end
end



require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

# Your code goes here ...
class Store < ActiveRecord::Base
end

puts "Total Revenue: #{Store.sum(:annual_revenue)}"

puts "Average Revenue: #{Store.average(:annual_revenue)}"

puts "Number of stores generating $1M or more : #{Store.where("annual_revenue >= ?", 1000000).count}"
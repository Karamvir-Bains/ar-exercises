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
  belongs_to :store

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
  validates :store, presence: true
end


class Store < ActiveRecord::Base
  has_many :employees

  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validate :must_carry_men_or_women_apparel

  def must_carry_men_or_women_apparel
    if !mens_apparel.present? && !womens_apparel.present?
      errors.add(:mens_apparel, "Store must carry at least one of the men's or women's apparel")
      errors.add(:womens_apparel, "Store must carry at least one of the men's or women's apparel")
    end
  end
end

puts "Enter a store name:"
store_name = gets.chomp

store = Store.new(name: store_name)
store.save

if store.errors.any?
  store.errors.full_messages.each do |message|
    puts message
  end
end
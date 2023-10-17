class Player < ApplicationRecord
  belongs_to :team

  def self.display_true
    where(retired: true)
  end

  def self.order_by_name
    order(:name)
  end

  def self.display_age_greater_than(number)
    where("age > #{number}")
  end
end
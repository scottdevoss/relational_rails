class Player < ApplicationRecord
  belongs_to :team

  def self.display_true
    where(retired: true)
  end
end
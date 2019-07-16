class Restaurant < ApplicationRecord
  validates :name, :uniqueness
  has_many :experiences
  has_many :users, through: :experiences
end

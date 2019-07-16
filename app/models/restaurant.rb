class Restaurant < ApplicationRecord
  validates :name, uniqueness: true
  validates :phone, format: { with: /\A\(?\d{3}\)?[- ]?\d{3}[- ]?\d{4}\z/,
                              message: "must be in the format (xxx) xxx-xxxx or xxx-xxx-xxxx"}
  has_many :experiences
  has_many :users, through: :experiences
  accepts_nested_attributes_for :experiences
end

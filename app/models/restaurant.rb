class Restaurant < ApplicationRecord
  validates :name, uniqueness: true
  validates :phone, format: { with: /\A\(?\d{3}\)?[- ]?\d{3}[- ]?\d{4}\z/,
                              message: "must be in the format (xxx) xxx-xxxx or xxx-xxx-xxxx"}
  has_many :experiences
  has_many :users, through: :experiences
  accepts_nested_attributes_for :experiences

  scope :denver, -> {where(city: "Denver")}
  scope :highest_price, -> {order('price desc').limit(5)}
  scope :lowest_price, -> {order('price asc').limit(5)}

  def avg_rating
    self.experiences.average(:rating)
  end

end

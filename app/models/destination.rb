class Destination < ApplicationRecord
  has_many :trips
  has_many :comments
  has_many :users, through: :trips
end

class Destination < ApplicationRecord
  has_many :trips, :dependent => :delete_all
  has_many :users, through: :trips
end

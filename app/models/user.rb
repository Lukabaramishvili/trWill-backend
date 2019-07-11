class User < ApplicationRecord
  belongs_to :subscription, optional: true
  has_many :trips
  has_many :comments
  has_many :destinations, through: :trips

  has_secure_password
  validates :username, :email, uniqueness: {case_sensitive: false}
end

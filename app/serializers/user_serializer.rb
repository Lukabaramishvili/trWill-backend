class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :username, :password_digest, :created_at
  belongs_to :subscription
  has_many :trips
end

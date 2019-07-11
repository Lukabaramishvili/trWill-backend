class DestinationSerializer < ActiveModel::Serializer
  attributes :id, :location, :description, :price, :image, :timeframe, :comments
  has_many :users
  has_many :comments
end

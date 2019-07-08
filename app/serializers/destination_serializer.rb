class DestinationSerializer < ActiveModel::Serializer
  attributes :id, :location, :description, :price, :image, :timeframe
  has_many :users
end

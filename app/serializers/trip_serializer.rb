class TripSerializer < ActiveModel::Serializer
  attributes :id, :destination
  belongs_to :destination
end

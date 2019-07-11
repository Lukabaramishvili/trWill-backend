class CommentSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :content, :user_id, :destination_id, :user
  belongs_to :user
end

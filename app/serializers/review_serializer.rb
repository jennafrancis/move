class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :rating, :group_class_id
  belongs_to :user
end

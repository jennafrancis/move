class GroupClassSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :studio
  has_many :reviews
end

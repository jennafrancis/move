class StudioSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :group_classes
end

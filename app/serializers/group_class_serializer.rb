class GroupClassSerializer < ActiveModel::Serializer
  attributes :id, :name, :duration, :studio
  # getting too much information from studio on user page with it listed as attribute, not enough with jsut belongs_to
  # belongs_to :studio, serializer: GroupClassStudioSerializer
  belongs_to :studio
  has_many :reviews
end

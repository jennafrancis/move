class Studio < ApplicationRecord
  belongs_to :city
  has_many :group_classes
  has_many :reviews, through: :group_classes

  validates_presence_of :name, :street_address, :city_id
  validates_uniqueness_of :street_address, scope: :city_id
end

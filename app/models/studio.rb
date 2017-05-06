class Studio < ApplicationRecord
  belongs_to :city
  has_many :group_classes
  has_many :reviews, through: :group_classes

  # method for avg rating, # of reviews, most popular class
end

class GroupClass < ApplicationRecord
  belongs_to :studio
  has_many :reviews
  has_many :category_group_classes
  has_many :categories, through: :category_group_classes


  validates :duration, numericality: { less_than: 360 }

  # method for avg rating, # of reviews
  def list_categories
    categories.map{|cat| cat.name}.join(", ")
  end
end

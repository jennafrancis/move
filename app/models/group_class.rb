class GroupClass < ApplicationRecord
  belongs_to :studio
  has_many :reviews
  has_many :category_group_classes
  has_many :categories, through: :category_group_classes

  validates :duration, numericality: { less_than: 360 }

  accepts_nested_attributes_for :categories, reject_if: proc { |attributes| attributes['name'].blank? }

  include ReviewAnalytics

  def list_categories
    categories.map{|cat| cat.name}.join(", ")
  end
end

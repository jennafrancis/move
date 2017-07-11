class GroupClass < ApplicationRecord
  belongs_to :studio
  has_many :reviews
  has_many :category_group_classes
  has_many :categories, through: :category_group_classes

  validates_presence_of :name, :duration
  validates :duration, numericality: { less_than: 360 }

  accepts_nested_attributes_for :categories, reject_if: proc { |attributes| attributes['name'].blank? }

  include ReviewAnalytics

  def list_categories
    categories.map{|cat| cat.name}.join(", ")
  end

  def best_review
    reviews.best_review
  end

  def self.next(studio, gc_id)
    group_class = studio.group_classes.find_by_id(gc_id)
    if !group_class
      array = studio.group_classes.map{|gc| gc.id }
      next_gc_id = array.detect{|i| i > gc_id.to_i}
      group_class = studio.group_classes.find_by_id(next_gc_id)
    end
    if !group_class
      group_class = studio.group_classes.first
    end
    group_class
  end
end

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

  def next(studio, id)
    studio = Studio.find(studio)
    studio.group_classes.map{|gc| gc.id}
    binding.pry

    @group_class = studio.group_classes.find_by_id(id)
    if !@group_class
      @group_class = studio.group_classes.first
    end
  end
end

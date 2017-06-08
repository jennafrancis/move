class Studio < ApplicationRecord
  belongs_to :city
  has_many :group_classes
  has_many :reviews, through: :group_classes

  validates_presence_of :name, :street_address, :city_id
  validates_uniqueness_of :street_address, scope: :city_id

  def class_list
    if group_classes.first 
      group_classes.map{|gc| gc.name }.join(", ")
    else
      "There are no classes listed yet!"
    end
  end
end

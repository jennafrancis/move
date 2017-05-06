class Category < ApplicationRecord
  has_many :category_group_classes
  has_many :group_classes, through: :category_group_classes
end

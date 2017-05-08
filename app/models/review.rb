class Review < ApplicationRecord
  belongs_to :user
  belongs_to :group_class

  validates_presence_of :content, :user_id, :group_class_id
  validates_inclusion_of :rating, :in => 1..5
end

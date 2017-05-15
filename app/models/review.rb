class Review < ApplicationRecord
  belongs_to :user
  belongs_to :group_class

  validates_presence_of :content, :user_id, :rating
  validates_inclusion_of :rating, :in => 1..5

  def group_class_attributes=(group_class_attributes)
    gc = GroupClass.find_or_create_by(group_class_attributes)
    self.group_class = gc
  end
end

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :group_class

  validates_presence_of :content, :user_id, :rating, :group_class_id
  validates_inclusion_of :rating, :in => 1..5
  # validates :group_class_id, presence: true, if: :existing_class

  def group_class_attributes=(group_class_attributes)
    if !group_class_attributes[:name].blank? && !group_class_attributes[:duration].blank?
      gc = GroupClass.find_or_create_by(group_class_attributes)
      self.group_class = gc
    end
  end

  def existing_class
    group_class_attributes[:name].blank? && group_class_attributes[:duration].blank?
  end
end

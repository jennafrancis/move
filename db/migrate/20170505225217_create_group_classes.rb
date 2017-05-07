class CreateGroupClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :group_classes do |t|
      t.string :name
      t.integer :duration
      t.integer :studio_id
    end
  end
end

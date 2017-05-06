class CreateCategoryGroupClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :category_group_classes do |t|
      t.integer :category_id
      t.integer :group_class_id

      t.timestamps
    end
  end
end

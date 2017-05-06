class CreateStudios < ActiveRecord::Migration[5.0]
  def change
    create_table :studios do |t|
      t.string :name
      t.string :street_address
      t.integer :city_id
    end
  end
end

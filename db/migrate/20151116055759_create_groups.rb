class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :groupable_type
      t.integer :groupable_id
      t.string :name

      t.timestamps null: false
    end
  end
end

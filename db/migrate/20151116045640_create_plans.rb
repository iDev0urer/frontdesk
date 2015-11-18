class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :price
      t.json :features

      t.timestamps null: false
    end
  end
end

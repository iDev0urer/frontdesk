class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :taggable_type
      t.integer :taggable_id
      t.string :name

      t.timestamps null: false
    end
  end
end

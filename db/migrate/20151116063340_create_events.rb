class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events, id: :uuid, default: 'uuid_generate_v1()', force: true do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end

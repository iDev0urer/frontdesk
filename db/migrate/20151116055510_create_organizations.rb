class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations, id: :uuid, default: 'uuid_generate_v1()', force: true do |t|
      t.string :name
      t.json :domains
      t.text :details
      t.text :notes
      t.uuid :tenant_id, index: true, foreign_key: true, default: 'uuid_generate_v1()'

      t.timestamps null: false
    end
  end
end

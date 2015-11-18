class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants, id: :uuid, default: 'uuid_generate_v1()', force: true do |t|
      t.string :name
      t.string :subdomain, null: false, unique: true
      t.references :plan, index: true, foreign_key: true
      t.json :settings

      t.timestamps null: false
    end
  end
end

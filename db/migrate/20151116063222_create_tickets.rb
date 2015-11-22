class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets, id: :uuid, default: 'uuid_generate_v1()', force: true do |t|
      t.string :title
      t.json :ccs
      t.references :ticket_type, index: true, foreign_key: true
      t.integer :priority
      t.string :status

      t.uuid :assignee_id, index: true, foreign_key: true
      t.uuid :requester_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

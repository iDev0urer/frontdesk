class CreateTicketEvents < ActiveRecord::Migration
  def change
    create_table :ticket_events do |t|
      t.uuid :ticket_id, index: true, foreign_key: true
      t.uuid :event_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

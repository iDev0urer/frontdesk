class CreateUserTickets < ActiveRecord::Migration
  def change
    create_table :user_tickets do |t|
      t.uuid :user_id, index: true, foreign_key: true
      t.uuid :ticket_id, index: true, foreign_key: true
      t.string :user_role

      t.timestamps null: false
    end
  end
end

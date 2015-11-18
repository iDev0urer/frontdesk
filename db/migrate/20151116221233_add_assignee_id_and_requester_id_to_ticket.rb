class AddAssigneeIdAndRequesterIdToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :assignee_id, :uuid, index: true, foreign_key: true
    add_column :tickets, :requester_id, :uuid, index: true, foreign_key: true
  end
end

class Ticket < ActiveRecord::Base
  has_one :ticket_type
  belongs_to :assignee, class_name: 'User', foreign_key: 'assignee_id'
  belongs_to :requester, class_name: 'User', foreign_key: 'requester_id'
  has_many :ticket_events
  has_many :events, through: :ticket_events
  has_many :user_tickets
  has_many :users, through: :user_tickets
end

class Event < ActiveRecord::Base
  has_many :ticket_events
  has_many :tickets, through: :ticket_events
end

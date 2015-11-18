class Plan < ActiveRecord::Base
  has_many :tenants
end

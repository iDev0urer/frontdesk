class Organization < ActiveRecord::Base
  belongs_to :tenant
  has_many :users
  has_many :tags, as: :taggable
  has_many :groups, as: :groupable
end

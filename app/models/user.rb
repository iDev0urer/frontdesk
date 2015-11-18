class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :organization
  has_many :user_tickets
  has_many :tickets, through: :user_tickets
  has_many :tags, as: :taggable
  has_many :groups, as: :groupable
end

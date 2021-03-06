class Tenant < ActiveRecord::Base

  validates_uniqueness_of :subdomain

  belongs_to :plan
  has_many :organizations

  private

  def create_default_organization
    Organization.create( name: self.name, tenant: self )
  end

end

class TenantController < ApplicationController

  before_action :authenticate_tenant, except: [:new_session, :new_registration, :create_registration]
  skip_before_filter :verify_authenticity_token, :only => :create_registration

  def index

  end

  def new_session
    render 'tenant/sessions/new_session'
  end

  def new_registration
    render 'tenant/registrations/new_registration'
  end

  def create_registration

    name = params[:full_name]
    email = params[:email]
    company = params[:company]
    password = params[:password]
    subdomain = params[:subdomain]

    tenant = Tenant.new(
      name: company,
      subdomain: subdomain
    )

    organization = Organization.new(
      name: company,
      tenant: tenant
    )

    user = User.new(
                 email: email,
                 password: password,
                 password_confirmation: password,
                 first_name: name.split.first,
                 last_name: name.split.last,
                 organization: organization
    )

    tenant.save!
    organization.save!
    user.save!

    sign_in_and_redirect user, subdomain: subdomain, controller: 'tenant', action: 'index'
  end

  def authenticate_tenant
    if user_signed_in? && user_belongs_to_tenant(current_user, Tenant.where(subdomain: request.subdomain).first)
      binding.pry
    else
      binding.pry
    end
  end

  def user_belongs_to_tenant(user, tenant)
    if user.organization.tenant.subdomain == tenant.subdomain
      true
    else
      false
    end
  end
end

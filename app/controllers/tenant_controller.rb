class TenantController < ApplicationController
  def new_session
    render 'tenant/sessions/new_session'
  end

  def new_registration
    render 'tenant/registrations/new_registration'
  end
end

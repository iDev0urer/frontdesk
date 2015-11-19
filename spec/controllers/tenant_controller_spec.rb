require 'rails_helper'

RSpec.describe TenantController, type: :controller do

  describe "GET #new_session" do
    it "returns http success" do
      get :new_session
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new_registration" do
    it "returns http success" do
      get :new_registration
      expect(response).to have_http_status(:success)
    end
  end

end

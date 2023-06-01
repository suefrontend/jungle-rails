require 'rails_helper'

RSpec.describe "Abouts", type: :request do
  describe "GET /about" do
    it "returns http success" do
      get "/about/about"
      expect(response).to have_http_status(:success)
    end
  end

end

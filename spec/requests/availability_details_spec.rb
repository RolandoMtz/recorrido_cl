require 'rails_helper'

RSpec.describe "AvailabilityDetails", type: :request do
  describe "GET /obten_disponibilidad" do
    it "returns http success" do
      get "/availability_details/obten_disponibilidad"
      expect(response).to have_http_status(:success)
    end
  end

end

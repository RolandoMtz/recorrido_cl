require "rails_helper"

RSpec.describe EngineerAvailabilitiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/engineer_availabilities").to route_to("engineer_availabilities#index")
    end

    it "routes to #new" do
      expect(get: "/engineer_availabilities/new").to route_to("engineer_availabilities#new")
    end

    it "routes to #show" do
      expect(get: "/engineer_availabilities/1").to route_to("engineer_availabilities#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/engineer_availabilities/1/edit").to route_to("engineer_availabilities#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/engineer_availabilities").to route_to("engineer_availabilities#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/engineer_availabilities/1").to route_to("engineer_availabilities#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/engineer_availabilities/1").to route_to("engineer_availabilities#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/engineer_availabilities/1").to route_to("engineer_availabilities#destroy", id: "1")
    end
  end
end

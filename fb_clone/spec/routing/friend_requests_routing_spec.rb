require "rails_helper"

RSpec.describe FriendRequestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/friend_requests").to route_to("friend_requests#index")
    end

    it "routes to #new" do
      expect(:get => "/friend_requests/new").to route_to("friend_requests#new")
    end

    it "routes to #show" do
      expect(:get => "/friend_requests/1").to route_to("friend_requests#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/friend_requests/1/edit").to route_to("friend_requests#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/friend_requests").to route_to("friend_requests#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/friend_requests/1").to route_to("friend_requests#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/friend_requests/1").to route_to("friend_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/friend_requests/1").to route_to("friend_requests#destroy", :id => "1")
    end
  end
end

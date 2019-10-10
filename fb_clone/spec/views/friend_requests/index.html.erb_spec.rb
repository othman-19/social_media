require 'rails_helper'

RSpec.describe "friend_requests/index", type: :view do
  before(:each) do
    assign(:friend_requests, [
      FriendRequest.create!(
        :user => nil
      ),
      FriendRequest.create!(
        :user => nil
      )
    ])
  end

  it "renders a list of friend_requests" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

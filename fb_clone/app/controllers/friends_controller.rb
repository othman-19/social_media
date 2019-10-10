class FriendsController < ApplicationController
  before_action :set_friend, only: :destroy

  def index
    @friends = user.friends
  end

  def destroy
    user.remove_friend(@friend)
    head :no_content
  end

  private

  def set_friend
    @friend = user.friends.find(params[:id])
  end
end

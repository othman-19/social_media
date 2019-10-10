# frozen_string_literal: true

class FriendsController < ApplicationController
  before_action :set_friend, only: :destroy

  def index
    @friends = current_user.friends
  end

  def destroy
    current_user.remove_friend(@friend)
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Friend removed' }
      format.json { head :no_content }
    end
  end

  private

    def set_friend
      @friend = current_user.friends.find(params[:id])
    end
end

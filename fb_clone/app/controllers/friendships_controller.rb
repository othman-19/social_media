class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    respond_to do |format|
      if @friendship.save
        format.html { redirect_to current_user, notice: 'Added friend' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to authenticated_root_path, alert: 'Unable to add friend.' }
        format.json { render json: authenticated_root_path.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to current_user, notice: "Removed friendship." }
      format.json { head :no_content }
    end
  end
end

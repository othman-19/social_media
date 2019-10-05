# frozen_string_literal: true

# Users controller
class UsersController < ApplicationController
  # before_action :set_user, only: %i[show edit update destroy]
  before_action :set_post, only: %i[edit]
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :current_user, only: %i[create destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.paginate(page: params[:page])
    @comments = @post.comments
    @comment = current_user.comments.build(post: @post)
  end

  def profile
    @user = User.find_by(id: params[:id])
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # def set_user
  #   #    @user = User.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end

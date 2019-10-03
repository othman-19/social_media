class LikesController < ApplicationController
  before_action :set_post
  before_action :set_like
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :current_user, only: %i[create destroy]

  def new
    @like = Like.new(like_params)
  end

  def create
    @like.user = current_user
    respond_to do |format|
      if @like.save!
        format.html { redirect_to authenticated_root_path}
        format.json { render :show, status: :created, location: @post, alert: 'Post liked!' }
      else
        format.html { redirect_to authenticated_root_path, alert: 'No like!' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  
    private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_like
      @like = @post.likes.build(like_params)
    end

    def like_params
      params.permit(:user_id, :post_id)
    end
end

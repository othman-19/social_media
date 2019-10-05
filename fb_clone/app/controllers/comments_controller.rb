# frozen_string_literal: true

# Comments controller
class CommentsController < ApplicationController
  before_action :set_post, only: %i[update destroy create edit]
  before_action :set_comment, only: %i[update destroy edit]
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :current_user, only: %i[create destroy]
  before_action :authorized_to_delete?, only: %i[destroy]
  before_action :authorized_to_edit?, only: %i[edit]

  def index
    @comments = Comment.all
   end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to authenticated_root_path, notice: 'Comment updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Comment removed' }
      format.json { head :no_content }
    end
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to authenticated_root_path, notice: 'Post commented.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to @post, alert: 'post not commented' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def authorized_to_delete?
    redirect_to :authenticated_root unless @post.user_id == current_user.id ||
                                           @comment.user_id == current_user.id
  end

  def authorized_to_edit?
    redirect_to :authenticated_root unless @comment.user_id == current_user.id
  end
end

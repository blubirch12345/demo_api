class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
    render json: @posts
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: { id: @post.id, message: "Post created successfully" }, status: :created
    else
      render json: { error: "Failed to create post" }, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: { id: @post_id, message: "Post updated successfully" }, status: :updated
    else
      render json: { error: "Failed to update post" }, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    render json: @posts
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :title, :body)
  end
end

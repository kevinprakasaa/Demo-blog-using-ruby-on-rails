class PostsController < ApplicationController

  def index #function to show all posts
    @posts = Post.all.order("created_at DESC")
  end

  def new #function to create a new post
    @post = Post.new
  end

  def create #function to create a new post
    @post = Post.new(post_params)
    if(@post.save)
      redirect_to @post
    else
      render 'new'
    end
  end

  def show #function to show post
    @post = Post.find(params[:id])
  end

  def update #function to update the post
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def edit #function to edit the post
    @post = Post.find(params[:id])
  end

  def destroy #function to delete the post
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private
  def post_params #declaring params for the post
    params.require(:post).permit(:title, :content)
  end

end

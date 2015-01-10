class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.sub_id = params[:sub_id]

    if @post.save
      redirect_to sub_url(@post.sub_id)
    else
      #might send another model as well if needed
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    post = @post.sub
    @post.destroy
    redirect_to sub_url(post), alert: "Successfully deleted"
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content)
  end
end

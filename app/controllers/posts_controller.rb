class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def edit
    @post= Post.find(params[:id])
  end
  
  def new
    @post=Post.new
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to @post
  end
  
  def create
     @post = Post.create(post_params)

    if @post.save
      flash[:notice] = 'スケジュールが投稿されました'
      redirect_to @post
    else
      flash[:notice] = 'スケジュールが投稿されません'
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to @post
  end
  
private
  def post_params
      params.require(:post).permit(:title, :start_at, :end_at, :allday, :memo)
  end
end


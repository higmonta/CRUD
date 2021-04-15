class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "新規投稿に成功しました。"
    else
      render :new
    end
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post, notice: "投稿の編集に成功しました。"
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path, notice: "削除に成功しました"
  end


  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end



  
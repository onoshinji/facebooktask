class PostsController < ApplicationController
  # ここから追記

  # before_action :authenticate_user
  before_action :ensure_correct_user, only:[:edit,:update,:destroy]
  before_action :set_post, only: [:show,:edit,:update,:destroy]
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path, notice: "投稿を作成しました"
      else
        render :new
      end
    end
  end

  def edit
  end
  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "投稿を編集しました！"
    else
      render :edit
    end
  end
  def show
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "投稿を削除しました"
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  private
  def post_params
    params.require(:post).permit(:title, :content,:image, :image_cache)
  end
  def set_post
    @post = Post.find(params[:id])
  end

  def authenticate_user
    if current_user == nil
      redirect_to new_session_path
    end
  end
#   def ensure_correct_user
#     if @current_user.id !=  params[:id].to_i
#       redirect_to posts_path notice: "あなたが投稿したもの以外は編集、削除できません。"
#     end
#   end
 end

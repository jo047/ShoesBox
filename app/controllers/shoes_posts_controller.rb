class ShoesPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_search

  def new
    @shoes_post = ShoesPost.new
  end

  # 投稿データ保存
  def create
    @shoes_post = ShoesPost.new(shoes_post_params)
    @shoes_post.user_id = current_user.id
    if @shoes_post.save
      redirect_to shoes_posts_path
    else
      render :new
    end
  end

  # 投稿一覧
  def index
    @shoes_posts = ShoesPost.page(params[:page]).reverse_order
  end

  def show
    @shoes_post = ShoesPost.find(params[:id])
    @shoes_comment = ShoesComment.new
  end

  def destroy
    @shoes_post = ShoesPost.find(params[:id])
    @shoes_post.destroy
    redirect_to shoes_posts_path
  end

  def set_search
    # @search = Article.search(params[:q])
    @search = ShoesPost.ransack(params[:q]) # ransackメソッド推奨
    @search_shoes_posts = @search.result.page(params[:page]).reverse_order
  end

  # 投稿データのストロングパラメータ
  private

  def shoes_post_params
    params.require(:shoes_post).permit(:shoes_image, :purchase_store, :shoes_name, :brand_name, :shoes_introduction)
  end
end

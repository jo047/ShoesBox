class ShoesPostsController < ApplicationController
  before_action :authenticate_user!

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

  # def index
  #   @q = ShoesPost.ransack(params[:q])
  #   @shoes_posts = @q.result(distinct: true)
  #   if @q_header
  #     @@shoes_posts = @q_header.result(distinct: true)
  #   end
  # end

  def show
    @shoes_post = ShoesPost.find(params[:id])
    @shoes_comment = ShoesComment.new
  end

  def destroy
    @shoes_post = ShoesPost.find(params[:id])
    @shoes_post.destroy
    redirect_to shoes_posts_path
  end

  # 投稿データのストロングパラメータ
  private
  def shoes_post_params
    params.require(:shoes_post).permit(:shoes_image, :purchase_store, :shoes_name, :brand_name, :shoes_introduction )
  end

end

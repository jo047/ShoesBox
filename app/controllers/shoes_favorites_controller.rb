class ShoesFavoritesController < ApplicationController
  def create
    @shoes_post = ShoesPost.find(params[:shoes_post_id])
    @shoes_favorite = current_user.shoes_favorites.new(shoes_post_id: @shoes_post.id)
    @shoes_favorite.save
    # redirect_to shoes_post_path(shoes_post)
  end

  def destroy
    @shoes_post = ShoesPost.find(params[:shoes_post_id])
    @shoes_favorite = current_user.shoes_favorites.find_by(shoes_post_id: @shoes_post.id)
    #byebug
    @shoes_favorite.destroy
    # redirect_to shoes_post_path(shoes_post)
  end

end
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def after_sign_up_path_for(resource)
    shoes_posts_path(resource)
  end

  def after_sign_in_path_for(resource)
    shoes_posts_path(resource)
  end

  def set_search
    #@search = Article.search(params[:q])
    @search = ShoesPost.ransack(params[:q]) #ransackメソッド推奨
    @search_shoes_posts = @search.result.page(params[:page]).reverse_order
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

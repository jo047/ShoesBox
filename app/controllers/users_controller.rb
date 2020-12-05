class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @shoes_posts = @user.shoes_posts.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :self_introduction, :profile_image)
  end
end

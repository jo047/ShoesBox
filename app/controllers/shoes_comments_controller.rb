class ShoesCommentsController < ApplicationController

  def create
    @shoes_post = ShoesPost.find(params[:shoes_post_id])
    @shoes_comment = current_user.shoes_comments.new(shoes_comment_params)
    @shoes_comment.shoes_post_id = @shoes_post.id
    @shoes_comment.save
    # redirect_to shoes_post_path(shoes_post)
  end

  def destroy
    @shoes_post = ShoesPost.find(params[:shoes_post_id])
    @shoes_comment = @shoes_post.shoes_comments.find(params[:id])
    @shoes_comment.destroy
  end

  private
  def shoes_comment_params
    params.require(:shoes_comment).permit(:comment)
  end
end

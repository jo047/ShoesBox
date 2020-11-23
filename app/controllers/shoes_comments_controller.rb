class ShoesCommentsController < ApplicationController

  def create
    shoes_post = ShoesPost.find(params[:shoes_post_id])
    comment = current_user.shoes_comments.new(shoes_comment_params)
    comment.shoes_post_id = shoes_post.id
    comment.save
    redirect_to shoes_post_path(shoes_post)
  end

  def destroy
    ShoesComment.find_by(id: params[:id], shoes_post_id: params[:shoes_post_id]).destroy
    redirect_to shoes_post_path(params[:shoes_post_id])
  end

  private
  def shoes_comment_params
    params.require(:shoes_comment).permit(:comment)
  end
end

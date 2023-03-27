class Public::CommentsController < ApplicationController
  def create
    airgun = Airgun.find(params[:airgun_id])
    comment = current_user.comments.new(comment_params)
    comment.airgun_id = airgun.id
    comment.save
    redirect_to request.referer
  end

private
  def comment_params
    params.require(:comment).permit(:comment_body)
  end
end

class CommentsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def new
    # render text: params
    @comment = Comment.new
  end

  def create
    if params[:question]
      q = Question.find_by(id: params[:question])
      new_comment = q.comments.build(body: params[:body], author_id: current_user.id)
      new_comment.save
      redirect_to(:back)
    elsif params[:answer]
      a = Answer.find_by(id: params[:answer])
      new_comment = a.comments.build(body: params[:body], author_id: current_user.id)
      new_comment.save
      redirect_to(:back)
    else
      c = Comment.find_by(id: params[:comment])
      new_comment = c.comments.build(body: params[:body], author_id: current_user.id)
      new_comment.save
      redirect_to(:back)
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:comment_id])
    if current_user.id == comment.author_id
      comment.delete
      comment.save
      flash[:success] = "Your comment was deleted"
      redirect_to(:back)
    else
      flash[:error] = "You are not authorized to delete this comment."
      redirect_to(:back)
    end
  end

  private

  def require_login
    return true unless !logged_in?
    else flash[:error] = "You must be logged in to do that."
    redirect_to(:back)
  end

end

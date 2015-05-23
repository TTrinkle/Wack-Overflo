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
      redirect_to question_path(q)
    elsif params[:answer]
      a = Answer.find_by(id: params[:answer])
      new_comment = a.comments.build(body: params[:body], author_id: current_user.id)
      new_comment.save
      redirect_to question_path(a.question)
    # else
    #   c = Comment.find_by(id: params[:comment])
    #   new_comment = c.comments.build(body: params[:body], author_id: current_user.id)
    #   new_comment.save
    #   redirect_to question_path(c.question)
    end
  end

  private

  def require_login
    return true unless !logged_in?
    else flash[:error] = "You must be logged in to do that."
    redirect_to(:back)
  end

end

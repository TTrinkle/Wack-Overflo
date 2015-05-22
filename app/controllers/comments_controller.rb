class CommentsController < ApplicationController
  def new
    # render text: params
    @comment = Comment.new(question_id: @question.id)
  end

  def create
    if params[:question]
      p params
      q = Question.find_by(id: params[:question])
      new_comment = q.comments.build(body: params[:body], author_id: current_user.id)
      new_comment.save
    # elsif params[:answer]

    # else
    redirect_to question_path(q)

    end
  end
end

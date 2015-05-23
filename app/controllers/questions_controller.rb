class QuestionsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_params, only: [:create, :update]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    new_question = Question.new(get_params)
    if new_question.save
      flash[:success] = "Your question was saved"
      redirect_to root_path
    else
      flash[:error] = "Your question could not be saved"
      redirect_to new_question_path
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    edited_question = Question.find(params[:id])
    if edited_question.update_attributes(get_params)
      flash[:success] = "Your question was updated"
      redirect_to root_path
    else
      flash[:error] = "Your question could not be updated"
      redirect_to new_question_path
    end
  end

  def destroy
  end

  def upvote
    @question = Question.find params[:id]
    @question.upvote_by current_user
    redirect_to question_path
  end

  def downvote
    @question = Question.find params[:id]
    @question.downvote_by current_user
    redirect_to question_path
  end

  private

  def require_login
    return true unless !logged_in?
    else flash[:error] = "You must be logged in to do that."
    redirect_to(:back)
  end

  def get_params
    params.require(:question).permit(:title, :body, :score).merge(user_id: 1)
  end

end

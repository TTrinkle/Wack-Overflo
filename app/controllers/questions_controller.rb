class QuestionsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_params, only: [:create, :update]

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    new_question = Question.new(get_params)
    new_question.user = current_user
    if new_question.save
      flash[:success] = "Your question was saved"
      redirect_to root_path
    else
      flash[:error] = "Your question could not be saved"
      redirect_to new_question_path
    end
  end

  def show
    @question = Question.find_by(id: params[:id])
    @answer = Answer.new
  end

  def edit
    @question = Question.find_by(id: params[:id])
  end

  def update
    edited_question = Question.find_by(id: params[:id])
    if edited_question.update_attributes(get_params)
      flash[:success] = "Your question was updated"
      redirect_to edited_question
    else
      flash[:error] = "Your question could not be updated"
      redirect_to edited_question
    end
  end

  def destroy
    question = Question.find_by(id: params[:question_id])
    if current_user.id == question.user_id
      question.destroy
      flash[:success] = "Your question was deleted"
      redirect_to root_path
    else
      flash[:error] = "You are not authorized to delete this question."
      redirect_to root_path
    end
  end

  def upvote
    @question = Question.find_by id: params[:id]
    @question.upvote_by current_user
    redirect_to question_path
  end

  def downvote
    @question = Question.find_by id: params[:id]
    @question.downvote_by current_user
    redirect_to question_path
  end

  def set_answer
    question = Question.find_by_id params[:id]
    if current_user && current_user.id == question.user_id
      question.selected_answer = params[:answer_id]
      question.save
      redirect_to :back
    else
      flash[:error] = "You are not authorized to select a best answer for this question."
      redirect_to :back
    end
  end

  private

  def require_login
    return true unless !logged_in?
    else flash[:error] = "You must be logged in to do that."
    redirect_to :back
  end

  def get_params
    params.require(:question).permit :title, :body, :selected_answer
  end

end
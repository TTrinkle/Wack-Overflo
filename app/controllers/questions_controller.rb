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

  private

  def require_login
    return true #unless is_authenticated?(params[:user_id])
    # redirect_to login w/ flash message or something like this
  end

  def get_params
    params.require(:question).permit(:title, :body, :score).merge(user_id: 1)
  end

end

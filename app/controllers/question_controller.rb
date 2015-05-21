class QuestionController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def require_login
    return true #unless is_authenticated?(params[:user_id])
    # redirect_to login w/ flash message or something like this
  end

end

class QuestionController < ApplicationController
  before_action :load_question

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

  def load_question
    @question = Question.find(params[:id])
  end

end

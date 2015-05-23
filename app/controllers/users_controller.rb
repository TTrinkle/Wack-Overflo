class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'User was successfully created.'
    else
      render new_user_path, notice: "Error User Not Created"
    end
  end

  def show
    @user = User.find_by_id params[:id]
    @questions = @user.my_questions
    @answers = @user.my_answers
    @comments = @user.my_comments
    @question_answers = @user.my_unanswered_questions
  end

  def edit
    @user = User.find_by_id session[:user_id]
  end

  def update
    @user = User.find_by_id session[:user_id]
    if @user.update_attributes user_params
      redirect_to @user, notice: 'User was successfully updated.'
    else
      redirect_to edit_user_path, notice: 'Error: User was not updated.'
    end
  end

  def destroy
    @user = User.find_by_id session[:user_id]
    if @user.destroy
      redirect_to root_path, notice: 'User account has been deleted.'
    else
      redirect_to root_path, notice: 'Error: account unable to be deleted.'
    end
  end

  def make_graph
  end

  private
    def user_params
      params.require(:user).permit :username, :email, :password
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
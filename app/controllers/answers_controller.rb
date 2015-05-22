class AnswersController < ApplicationController

	def create
		@answer = Answer.new 
		if @answer.save
			redirect_to root_path
		else
			redirect_to question_path
		end
	end

	def new
		@answer = Answer.new
	end

	def update 

	end

	def edit

	end

	def destroy

	end


	private

	# def answer_params
	# 	params[:answer][:user_id] = session[:id]
	# 	params[:answer][:question_id] = params[:question_id]
	# 	params.require(:answer).permit(:body, :user_id, :question_id)
	# end
end
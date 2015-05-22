class AnswersController < ApplicationController

	def create
		@answer = Answer.new(answer_params)
		@answer.author_id = session[:user_id]
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
		answer = Answer.find_by(id: params[:id])
		answer.delete
		answer.save
		redirect_to root_path
	end


	private

	def answer_params
		params[:answer][:question_id] = params[:question_id]
		params.require(:answer).permit(:body, :question_id)
	end
end

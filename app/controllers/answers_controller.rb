class AnswersController < ApplicationController

	def create
		@answer = Answer.new(answer_params)
		@answer.author_id = session[:user_id]
		if @answer.save
			redirect_to question_path(@answer.question)
		else
			redirect_to question_path(@answer.question)
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
		if current_user.id == answer.author_id
			answer.delete
			answer.save
			flash[:success] = "Your answer was deleted."
			redirect_to(:back)
		 else
      flash[:error] = "You are not authorized to delete this question."
      redirect_to(:back)
    end
	end


	private

	def answer_params
		params[:answer][:question_id] = params[:question_id]
		params.require(:answer).permit(:body, :question_id)
	end
end

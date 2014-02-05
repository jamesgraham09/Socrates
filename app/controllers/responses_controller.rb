class ResponsesController < ApplicationController

	def new
		@response = Response.new
		@question = Question.first
	end

	def create
		@user = current_user
		@question = Question.first
		@response = Response.new(params[:response], question_id: @question.id, user_id: @user.id).permit(:outcome, :time)
		@response.save
	end

end

class QuestionsController < ApplicationController
	def new
		@question = Question.new
	end

	def create
		@question = Question.new params[:question].permit(:text, :answer, :start_difficulty)
		if @question.save
			redirect_to question_path(@question)
		else
			redirect to edit_question_path(@question)
		end
	end

	def index
		@questions = Question.all
	end

	def show
		@question = Question.find params[:id]
	end

	def edit
		@question = Question.find params[:id]
	end

	def update
		@question = Question.find params[:id]
		if @question.save
			redirect_to question_path(@question)
		else
			redirect to edit_question_path(@question)
		end
	end

	def destroy
		@question = Question.find params[:id]
		@question.delete
		redirect_to questions_path
	end
end

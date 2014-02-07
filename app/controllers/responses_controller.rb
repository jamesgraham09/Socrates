class ResponsesController < ApplicationController

	def new
		@response = Response.new
		# @question = Question.last
		@question = 
			if user_signed_in?
				Question.where(:start_difficulty => ((current_user.get_rating - 200)..999)).sample
			else 
				Question.where(:start_difficulty => (200..300)).sample
			end
		session[:start_time] = Time.now
	end

	def create
		@question = Question.find(params[:question_id])
		start_time = session[:start_time]
		end_time = Time.now
		@response = Response.new
		@response.user_id = current_user.id
		@response.question_id = @question.id
		
		@response.time = (1000*(end_time - start_time)).to_i

		@response.outcome = 
			if params[:response][:answer] == @question.answer
				'correct'
			else 
				'incorrect'
			end

		@response.save
		redirect_to new_response_path
	end

end


	# def create
	# 	@response = Response.new
	# 	@user = current_user
	# 	@question = Question.find(params[:question_id])
	# 	if @response[:answer] == @question.answer
	# 		@outcome = 'correct'
	# 	else
	# 		@outcome = 'incorrect'
	# 	end

	# 	@response = Response.new(params[:response], question_id: @question.id, user_id: current_user.id, outcome: @outcome, time: 999)
	# 	@response.save
	# end

	# Question.all.select{|key, key[:start_difficulty]| (current_user.rating - key[:start_difficulty]) - 100 < 1000}
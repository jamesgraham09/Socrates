class ResponsesController < ApplicationController

	def new
		if user_signed_in?
			@response = Response.new
			# @question = Question.last
			@question = 
				if user_signed_in? && current_user.questions.size > 0
					Question.where("id NOT IN (?)", current_user.questions.map(&:id)).where("start_difficulty > ?", current_user.get_rating + current_user.dif_adjust).order('start_difficulty').first
				else 
					Question.where(:start_difficulty => 1).sample
				end
			session[:start_time] = Time.now
			@previous_score = session[:previous_score]
			@running_time = session[:running_time]
			@last_answer = session[:last_answer]
			@last_response = current_user.responses.last
			@last_question = 
				if @last_response == nil
					nil
				else
					@last_response.question
				end
		else 
			redirect_to new_user_registration_path
		end
	end

	def create
		@question = Question.find(params[:question_id])
		start_time = session[:start_time]
		session[:last_answer] = params[:response][:answer]
		session[:previous_score] = current_user.get_rating
		end_time = Time.now
		@response = Response.new
		@response.user_id = current_user.id
		@response.question_id = @question.id
		
		@response.time = (1000*(end_time - start_time)).to_i
		
		session[:running_time] ||= 0
		session[:running_time] = @response.time + session[:running_time]

		@response.outcome =
			# if params[:commit] == "Make it easier"
			# 	'easier'
			# elsif params[:commit] == "Make it harder"
			# 	'harder'
			if params[:response][:answer] == @question.answer
				'correct'
			else
				'incorrect'
			end

		@response.save
		redirect_to '/next_question'
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
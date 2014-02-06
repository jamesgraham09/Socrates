class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :responses

  

  def get_rating
  	correct_difficulties = []
  	incorrect_difficulties = []
  	# @user = User.last
  	# questions_answered = responses

  	if responses.size == 0
  		200
  	else
	  	responses.each do |response|
	  		if response.outcome == "correct"
	  			correct_difficulties << response.question.start_difficulty
	  		else
	  			'blah'
	  			# incorrect_difficulties << question.start_difficulty
	  		end
	  	end
	  	
	  	puts correct_difficulties.inspect
	  	correct_difficulties.inject{ |sum, el| sum + el }.to_f / correct_difficulties.size
	  end

  end


end
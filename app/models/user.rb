class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :responses
  has_many :questions, through: :responses

  RECENT = 15
   DELTA = 333
  USER_ADJUSTMENT = 50
 


  def get_rating
    if responses.size == 0
      return 0
    else
      difficulties = []
      outcomes = []
      responses.where(outcome: ['correct','incorrect']).last(RECENT).each do |response|
        difficulties << response.question.start_difficulty
        outcomes << response.outcome
      end
    end

    calculated_rating = (difficulties.inject{ |sum, el| sum + el }.to_f +	DELTA * (outcomes.count('correct') - outcomes.count('incorrect'))) / outcomes.size

    calculated_rating * (outcomes.size.to_f / RECENT.to_f)
  end 


  def dif_adjust
    desired_rating = (responses.where(outcome: 'harder').count * USER_ADJUSTMENT) - (responses.where(outcome: 'easier').count * USER_ADJUSTMENT)
      if desired_rating > 200
        return 100
      elsif desired_rating < -200
        return -200
      else
        return desired_rating
      end
  end

  def average_speed
    times = []
    responses.where(outcome: ['correct','incorrect']).last(RECENT).each do |response|
      times << response.time
    end
    times.inject{ |sum, el| sum + el }.to_f / times.size
  end


  def get_rating_old
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
	  	
	  	return 200 if correct_difficulties.none?
	  	correct_difficulties.inject{ |sum, el| sum + el }.to_f / correct_difficulties.size
	  end
  end

  def questions_answered
    responses.size
  end

  def correct_answers
    responses.where(outcome: 'correct').size
  end

  def median_speed
    
  end


end	
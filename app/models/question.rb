class Question < ActiveRecord::Base
	has_many :responses
	
	def match_up
	end
end

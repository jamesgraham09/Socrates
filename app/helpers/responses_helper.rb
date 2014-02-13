module ResponsesHelper
	def change_direction(rating_change)
		if rating_change > 0
			"+#{rating_change.to_i}"
		else
			rating_change.to_i
		end
	end

	def show_last_answer(last_answer)
		if last_answer == ""
			"???"
		else
			last_answer
		end
	end
end

module ResponsesHelper
	def change_direction(rating_change)
		if rating_change > 0
			"+#{rating_change.to_i}"
		else
			rating_change.to_i
		end
	end
end

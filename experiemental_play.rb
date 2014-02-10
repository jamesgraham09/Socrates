def generate_factor(arr1, factor, start_difficulty)
	array = arr1.to_a.shuffle
	var1 = array.first
	array.delete(var1)
	@question_text = var1.to_s + ' ^ ' + factor.to_s
	@question_answer = (var1 ^ factor).to_s
	@question_start_difficulty = start_difficulty

	puts @question_text
end

def generate_addition(arr1, arr2, start_difficulty)
end

10.times do generate_factor((1..10),2,100) end
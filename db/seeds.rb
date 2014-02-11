# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Response.delete_all
Question.delete_all

def generate_multiplication(arr1, arr2, start_difficulty)
	var1 = arr1.to_a.shuffle.first
	var2 = arr2.to_a.shuffle.first
	@question_text = var1.to_s + ' * ' + var2.to_s
	@question_answer = (var1 * var2).to_s
	@question_start_difficulty = start_difficulty
	Question.create(text: @question_text, answer: @question_answer, start_difficulty: @question_start_difficulty)
end

def generate_factor(arr1, factor, start_difficulty, number_of_questions = 10)
	array = arr1.to_a.shuffle!.last(number_of_questions)
	array.each do |var1|
		@question_text = "#{var1.to_s} <sup>#{factor.to_s}</sup>"
		@question_answer = (var1 ** factor).to_s
		@question_start_difficulty = start_difficulty
		Question.create(text: @question_text, answer: @question_answer, start_difficulty: @question_start_difficulty)
	end
end

def generate_addition(arr1, arr2, start_difficulty)
	var1 = arr1.to_a.shuffle.first
	var2 = arr2.to_a.shuffle.first
	@question_text = var1.to_s + ' + ' + var2.to_s
	@question_answer = (var1 + var2).to_s
	@question_start_difficulty = start_difficulty
	Question.create(text: @question_text, answer: @question_answer, start_difficulty: @question_start_difficulty)
end



20.times do generate_multiplication((2..9),(2..9),50) end
20.times do generate_multiplication((2..9),(11..19),150) end
20.times do generate_multiplication((11..19),(11..19),250) end
20.times do generate_multiplication((11..19),(21..29),350) end
20.times do generate_multiplication((21..29),(21..29),450) end
20.times do generate_multiplication((31..49),(21..29),550) end
20.times do generate_multiplication((31..49),(31..49),650) end
20.times do generate_multiplication((31..49),(51..99),750) end
20.times do generate_multiplication((51..99),(51..99),850) end
20.times do generate_multiplication((111..199),(111..199),950) end

20.times do generate_addition((1..9),(1..9),1) end
20.times do generate_addition((11..19),(11..19),50) end
20.times do generate_addition((21..29),(21..29),150) end
20.times do generate_addition((31..99),(31..99),150) end
20.times do generate_addition((101..199),(101..199),200) end
20.times do generate_addition((1001..1999),(1001..1999),300) end
20.times do generate_addition((2001..4999),(2001..4999),400) end
20.times do generate_addition((5001..9999),(5001..9999),500) end
20.times do generate_addition((10001..99999),(10001..99999),600) end
20.times do generate_addition((100001..999999),(100001..999999),700) end


generate_factor((1..10),2,100)
generate_factor((11..20),2,200)
generate_factor((21..29),2,400)
generate_factor((31..49),2,600)
generate_factor((51..99),2,800,20)
generate_factor((111..199),2,1000,20)

generate_factor((2..10),3,300)
generate_factor((11..20),3,300)
generate_factor((21..29),3,500)
generate_factor((31..49),3,700,20)
generate_factor((51..99),3,900,20)

generate_factor((2..10),4,400)
generate_factor((2..10),5,600)
generate_factor((2..10),6,800)
generate_factor((2..10),8,1000)
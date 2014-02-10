# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



def generate_multiplication(arr1, arr2, start_difficulty)
	var1 = arr1.to_a.shuffle.first
	var2 = arr2.to_a.shuffle.first
	@question_text = var1.to_s + ' * ' + var2.to_s
	@question_answer = (var1 * var2).to_s
	@question_start_difficulty = start_difficulty
	Question.create(text: @question_text, answer: @question_answer, start_difficulty: @question_start_difficulty)
end

def generate_factor(arr1, factor, start_difficulty)
	array = arr1.to_a.shuffle
	var1 = array.first
	array.delete(var1)
	@question_text = var1.to_s + ' ^ ' + factor.to_s
	@question_answer = (var1 ^ factor).to_s
	@question_start_difficulty = start_difficulty
	Question.create(text: @question_text, answer: @question_answer, start_difficulty: @question_start_difficulty)
end

def generate_addition(arr1, arr2, start_difficulty)
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

10.times do generate_factor((1..10),2,100) end
10.times do generate_factor((11..20),2,200) end
10.times do generate_factor((21..29),2,400) end
20.times do generate_factor((31..49),2,600) end
20.times do generate_factor((51..99),2,800) end
20.times do generate_factor((111..199),2,1000) end

9.times do generate_factor((2..10),3,200) end
10.times do generate_factor((11..20),3,300) end
10.times do generate_factor((21..29),3,500) end
20.times do generate_factor((31..49),3,700) end
20.times do generate_factor((51..99),3,900) end

9.times do generate_factor((2..10),4,400) end
9.times do generate_factor((2..10),5,500) end
9.times do generate_factor((2..10),6,600) end
9.times do generate_factor((2..10),7,800) end
9.times do generate_factor((2..10),8,1000) end
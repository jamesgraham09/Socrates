# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



def generate_question(arr1, arr2)
	var1 = arr1.to_a.shuffle.first
	var2 = arr2.to_a.shuffle.first
	@question_text = var1.to_s + ' * ' + var2.to_s
	@question_answer = (var1 * var2).to_s
	@question_start_difficulty = (var1 + var2)*5
end

500.times do
	generate_question((11..99),(11..99))
	Question.create(text: @question_text, answer: @question_answer, start_difficulty: @question_start_difficulty)
end
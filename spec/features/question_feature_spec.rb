require 'spec_helper'

describe "in the questions class" do
	context "new questions" do
		it "can be created a question, answer and difficulty rating" do
			visit new_question_path
			fill_in 'text', with: '10 * 11'
			fill_in 'answer', with: '110'
			fill_in 'start_difficulty', with: '100'
			click_button 'Submit'
			expect(current_path).to be(question_path)
			expect(page).to have_content('10 * 11')
			expect(page).to have_content('110')
			expect(page).to have_content('100')
			expect(page).to have_content('0 answers')
		end

		it "can be "

		end
	end

	context "existing questings" do

		it "can be removed" do
		end

		it "can be modified" do
		end
	end


	context "answering_questions" do
		it "can identify a correct answer and adjust question rating" do
		end

		it "can identify a wrong answer and adjust difficulty rating" do
		end
	end

	end
end
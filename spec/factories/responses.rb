# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :response do
    user_id "MyString"
    question_id "MyString"
    outcome "MyString"
    time 1
  end
end

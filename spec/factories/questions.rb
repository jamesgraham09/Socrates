# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    text "MyText"
    answer "MyString"
    start_difficulty 1
  end
end

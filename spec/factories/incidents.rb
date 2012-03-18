# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :incident do

    first_name "MyString"
    second_name "MyString"
    patronymic_name "MyString"
    birth_date "2012-03-11"
  end
end
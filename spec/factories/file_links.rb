# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :file_link do
    type ""
    url "MyString"
    user nil
  end
end

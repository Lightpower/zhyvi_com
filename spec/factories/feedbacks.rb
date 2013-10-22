# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedback do
    event nil
    user nil
    file_link nil
    data "MyText"
  end
end

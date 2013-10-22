# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    type ""
    title "MyString"
    preview "MyText"
    data "MyText"
    user nil
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    type ""
    title "MyString"
    preview "MyText"
    data "MyText"
    start_at "2013-10-22 16:54:00"
    finish_at "2013-10-22 16:54:00"
    user nil
  end
end

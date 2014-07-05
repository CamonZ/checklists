# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :measurement do
    check_item
    user
  end
end

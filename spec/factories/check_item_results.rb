# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :check_item_result do
    value 0.0
    survey
    check_item
    user
  end
end

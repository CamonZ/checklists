# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :check_item_result do
    check_item
    survey
    user { check_item.user }
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :check_item do
    checklist
    user { checklist.user }
  end
end

FactoryGirl.define do 
  factory :user do
    first_name "Sergey"
    last_name "Gey"
    provider 'email'
    email 'victor.r@ukr.net'
    password '8102977aa'
  end
end
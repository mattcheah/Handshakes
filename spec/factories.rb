
FactoryBot.define do 
    factory :user do |u|
        first "matt"
        last "cheah"
        u.sequence(:email) { |n| "mcheah#{n}@gmail.com"}
        password "mypassword"
    end
end
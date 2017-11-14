
FactoryBot.define do 
    factory :user do |u|
        first "matt"
        last "cheah"
        u.sequence(:email) { |n| "mcheah#{n}@gmail.com"}
        password "mypassword"
    end
end

Factorybot.define do 
    factory :skill do |s|
        s.sequence(:name) { |n| "skill #{n}"}
        s.sequence(:category) { |n| "category #{n}"}
        s.sequence(:description) { |n| "description #{n}"}
    end
end
        
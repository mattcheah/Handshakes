
FactoryBot.define do 
    factory :user do |u|
        first "matt"
        last "cheah"
        u.sequence(:email) { |n| "mcheah#{n}@gmail.com"}
        password "mypassword"
    end
    
    factory :skill do |s|
        s.sequence(:name) { |n| "skill #{n}"}
        s.sequence(:category) { |n| "category #{n}"}
        s.sequence(:description) { |n| "description #{n}"}
    end
    
    factory :cause do |c|
        c.sequence(:name) { |n| "cause #{n}"}
        c.sequence(:category) { |n| "cause category #{n}"}
        c.sequence(:description) { |n| "cause description #{n}"}
    end
end

        
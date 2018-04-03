new_causes = [
    {
        name: "Homelessness",
        category: "",
        description: ""
    },
    {
        name: "Human Trafficking",
        category: "",
        description: ""
    },
    {
        name: "Single Mothers",
        category: "",
        description: ""
    },
    {
        name: "Animal Rescue",
        category: "",
        description: ""
    },
    {
        name: "Poverty",
        category: "",
        description: ""
    },
    {
        name: "Hunger",
        category: "",
        description: ""
    },
    {
        name: "LGBTQ+ Rights",
        category: "",
        description: ""
    },
]



new_causes.each do |cause|
    Cause.create!(cause)
end

# Add Causes to users
(0..5).each do |x|
    UserCauses.create({user_id: User.first.id, cause_id: Cause.first.id+x})
end

(5..10).each do |x|
    UserCauses.create({user_id: User.second.id, cause_id: Cause.first.id+x})
end
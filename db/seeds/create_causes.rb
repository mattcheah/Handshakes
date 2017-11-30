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
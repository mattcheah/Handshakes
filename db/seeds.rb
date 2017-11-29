# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Skill.delete_all
Cause.delete_all

new_skills = [
    {
        name: "HTML",
        category: "Development",
        description: "HTML for web development"
    },
    {
        name: "PHP",
        category: "Development",
        description: "PHP - a back end server-side language"
    }, 
    {
        name: "Ruby",
        category: "Development",
        description: "Ruby - a back end server-side language"
    }, 
    {
        name: "Ruby on Rails",
        category: "Development",
        description: "A Ruby MVC framework for quickly building database-driven websites"
    }, 
    {
        name: "Javascript",
        category: "Development",
        description: "The language of front-end web development"
    }, 
    {
        name: "Angular",
        category: "Development",
        description: "A Javascript framework created by Google, often used for single page applications"
    }, 
    {
        name: "Microsoft Word",
        category: "Productivity",
        description: "A text editor for composing and laying out a document"
    }, 
    {
        name: "Microsoft Excel",
        category: "Productivity",
        description: "A spreadsheet program that allows the user to layout and interpret large amounts of data"
    }, 
    {
        name: "Adobe Premiere",
        category: "Video Production",
        description: "An industry standard video editor"
    }, 
    {
        name: "iMovie",
        category: "Video Production",
        description: "A standard Mac application for making easy edits to a video"
    }, {
        name: "Adobe After Effects",
        category: "Video Production",
        description: "A compositing program used to create visual effects"
    }, {
        name: "Salesforce",
        category: "CRM",
        description: "Customer Relations Management in the cloud"
    }, 
]

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

new_skills.each do |skill|
    Skill.create!(skill)
end

new_causes.each do |cause|
    Cause.create!(cause)
end

UserSkill.create({user_id: User.first.id, skill_id: Skill.first.id})
UserSkill.create({user_id: User.first.id, skill_id: Skill.second.id})
UserSkill.create({user_id: User.first.id, skill_id: Skill.third.id})
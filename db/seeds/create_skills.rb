
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

# Create Skills
new_skills.each do |skill|
    Skill.create!(skill)
end

# Add Skills to users
(0..5).each do |x|
    UserSkill.create({user_id: User.first.id, skill_id: Skill.first.id+x})
end

(5..10).each do |x|
    UserSkill.create({user_id: User.second.id, skill_id: Skill.first.id+x})
end

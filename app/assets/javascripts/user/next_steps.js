window.addEventListener('load', setupPageAjax);



function setupPageAjax() {
    
    addSkillSuccess();
    deleteSkillSuccess();
        
}    
    
    
function addSkillSuccess() {
    const skillsForm = document.getElementById("skills-form");
    skillsForm.addEventListener('ajax:success', function(response) {
        let skillInput = document.querySelector('[name=skill]');
        let skill = skillInput.value;
        const skillsMessages = document.getElementById('skills-form-messages');
        
        if (response.detail[1] == "Created") {
            skillsMessages.innerHTML = "Successfully added skill: "+skill;
        } else if (response.detail[0] == "This skill exists") {
            skillsMessages.innerHTML = "Skill "+skill+" already exists!";
        }
        
        skillInput.value = "";
    });
}

function deleteSkillSuccess() {
    const skillsBox = document.getElementById("all-skills-box");
    skillsBox.addEventListener('ajax:success', function(response) {
        console.log(response);
    });
}



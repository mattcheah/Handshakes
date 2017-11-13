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
            const newSkill = document.createElement("div")
            document.getElementById("all-skills-box").insertAdjacentHTML('beforeend','<div id="skill-'+skill+'" class="skill-badge">'+skill+'<span class="skill-delete"><form class="skill-delete-form" method="post" action="/users/delete_skill" data-remote="true"><input type="submit" value="X"><input type="hidden" name="authenticity_token" value="fH+/JwimNjgjN/mP9gWXvq95w03JVZR1yzpUSc245AlPRNJvbrMqwkZoIl6LKTZWCG8fGjbmVfrNQNfInjV8hw=="><input type="hidden" name="skill" value="asdfnew"></form></span></div>');
        } else if (response.detail[0] == "This skill exists") {
            skillsMessages.innerHTML = "Skill "+skill+" already exists!";
        }
        
        skillInput.value = "";
    });
}

function deleteSkillSuccess() {
    const skillsBox = document.getElementById("all-skills-box");
    const skillsMessages = document.getElementById('skills-form-messages');
    
    skillsBox.addEventListener('ajax:success', function(response) {
        console.log(response);
        const skill = response.detail[0];
        if (response.detail[2].status === 200) {
            
            const skillElement = document.getElementById("skill-"+skill);
            skillElement.parentElement.removeChild(skillElement);
            
            skillsMessages.innerHTML = "Successfully deleted skill: "+skill;
            
        } else {
            skillsMessages.innerHTML = "Could not delete skill: "+skill+". Please Try Again";
        }
    });
}



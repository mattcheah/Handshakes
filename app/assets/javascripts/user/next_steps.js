window.addEventListener('load', setupPageAjax);





function setupPageAjax() {
    addSkillSuccess();
    devareSkillSuccess();
        
}    
    
function addSkillSuccess() {
    var skillsForm = document.getElementById("skills-form");
    skillsForm.addEventListener('ajax:success', function(response) {
        var skillInput = document.querySelector('[name=skill]');
        var skill = skillInput.value;
        
        var skillsMessages = document.getElementById('skills-form-messages');
        if (response.detail[1] == "Created") {
            skillsMessages.innerHTML = "Successfully added skill: "+skill;
            var newSkill = document.createElement("div")
            document.getElementById("all-skills-box").insertAdjacentHTML('beforeend','<div id="skill-'+skill+'" class="skill-badge">'+skill+'<span class="skill-devare"><form class="skill-devare-form" method="post" action="/users/devare_skill" data-remote="true"><input type="submit" value="X"><input type="hidden" name="authenticity_token" value="fH+/JwimNjgjN/mP9gWXvq95w03JVZR1yzpUSc245AlPRNJvbrMqwkZoIl6LKTZWCG8fGjbmVfrNQNfInjV8hw=="><input type="hidden" name="skill" value="asdfnew"></form></span></div>');
        } else if (response.detail[0] == "This skill exists") {
            skillsMessages.innerHTML = "Skill "+skill+" already exists!";
        }
        
        skillInput.value = "";
    });
}

function devareSkillSuccess() {
    var skillsBox = document.getElementById("all-skills-box");
    var skillsMessages = document.getElementById('skills-form-messages');
    
    skillsBox.addEventListener('ajax:success', function(response) {
        console.log(response);
        var skill = response.detail[0];
        if (response.detail[2].status === 200) {
            
            var skillElement = document.getElementById("skill-"+skill);
            skillElement.parentElement.removeChild(skillElement);
            
            skillsMessages.innerHTML = "Successfully devared skill: "+skill;
            
        } else {
            skillsMessages.innerHTML = "Could not devare skill: "+skill+". Please Try Again";
        }
    });
}



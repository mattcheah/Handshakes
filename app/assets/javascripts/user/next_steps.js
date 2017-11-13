window.addEventListener('load', setupPageAjax);

function setupPageAjax() {
    const skillsForm = document.getElementById("skills-form");
    const causesForm = document.getElementById("causes-form");
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
    
    causesForm.addEventListener('ajax:success', function(response) {
        console.log("added cause"); 
    });
    // skillsForm.addEventListener('submit', addSkill);
        
}    
    
function addSkill(event) {
    event.preventDefault();
    console.log("called addSkill");
    
    const skill = document.querySelector('[name=skill]').value;
    const token = document.querySelector("[name=authenticity_token]").value;
    
    const content = {
        skill: skill,
        authenticity_token: token
    }
    
    const myInit = { 
        method: 'post',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(content),
    };
    
    fetch('/users/add_skill', myInit).then(function(response){
        if (response.ok) {
            console.log("successfully added skill?");
            console.log(response);
        } else {
            throw(response);
        }
    }).catch(function(response) {
        console.log("error: could not add skill");
            console.log(response);
    });
}

// function addCause() {
//     console.log("called addCause");
// }



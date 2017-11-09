window.addEventListener('load', setupNextSteps);

function setupNextSteps() {
    const skillsButton = document.getElementById("skills-submit-button");
    const causesButton = document.getElementById("causes-submit-button");
    skillsButton.addEventListener('click', addSkill);
    causesButton.addEventListener('click', addCause);
}    
    
function addSkill() {
    console.log("called addSkill");
    
    const skill = document.getElementById('skills-field').value;
    const token = document.head.querySelector("[name=csrf-token]").content;
    
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

function addCause() {
    console.log("called addCause");
}
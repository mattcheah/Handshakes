//= require angular
//= require user/next_steps
//= require_tree .

window.onload = function() {
    const alert = document.getElementById("alert");  
    const notice = document.getElementById("notice");  

    if (alert.innerHTML != "") {
        alert.style.display = "block";
    }
    if (notice.innerHTML != "") {
        notice.style.display = "block";
    }
    
    setupSkillsCauses();
};

setupSkillsCauses = function() {
    const skillsButton = document.getElementById("skills-submit-button");
    const causesButton = document.getElementById("causes-submit-button");
    skillsButton.addEventListener('click', addSkill);
    causesButton.addEventListener('click', addCause);
    
}

function addSkill() {
    console.log("called addSkill");
}

function addCause() {
    console.log("called addCause");
}
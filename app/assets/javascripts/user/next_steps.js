window.onload = function() {
    console.log("window.onload");
    const skillsButton = document.getElementById("skills-submit-button");
    const causesButton = document.getElementById("causes-submit-button");
    skillsButton.addEventListener('click', addSkill);
    causesButton.addEventListener('click', addCause);
    console.log("ended window.onload");
    
}

function addSkill() {
    console.log("called addSkill");
}

function addCause() {
    console.log("called addCause");
}
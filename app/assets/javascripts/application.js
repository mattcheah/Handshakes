//= require angular
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
};
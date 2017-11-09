// window.onload = function() {
//     console.log("ready");
//     if (document.getElementById('sign-out-button')) {
//         document.getElementById('sign-out-button').addEventListener('click', sign_out);
//     }
// };


// function sign_out() {
//     console.log("called sign_out");
    
//     const myHeaders = new Headers();
    
//     const myInit = { method: 'DELETE',
//                   headers: myHeaders,
//                   mode: 'cors',
//                   cache: 'default' };
    
//     fetch('/users/sign_out', myInit).then(function(response){
//         if (response.ok) {
//             console.log("successfully signed out?");
//             console.log(response);
//         } else {
//             alert("error: could not sign out");
//         }
//     });
// }

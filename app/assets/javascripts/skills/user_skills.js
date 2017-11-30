angular.module('handshakes')
.factory('userSkills', ['$http', function($http) {
    var skills  = {};
    // skills.get = function(id) {
    //     return $http.get('/skills/'+id+'.json').then(function(response) {
    //         return response.data;
    //     });        
    // };
    skills.all = function() {
        return $http.get('/user/skills.json').then(function(response){
           angular.copy(response.data, o.posts); 
        });
    };
    return skills;
}]);
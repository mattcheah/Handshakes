angular.module('handshakes')
.factory('posts', ['$http', function($http) {
    var o = {
        posts: [
            {title: 'post 1', upvotes: 12, comments: []},
            {title: 'post 2', upvotes: 15, comments: [
                    {author: 'Joe', body: 'Cool post!', upvotes: 0},
                    {author: 'Bob', body: 'Great idea but everything is wrong!', upvotes: 0}
                ]},
            {title: 'post 3', upvotes: 78, comments: []},
            {title: 'post 4', upvotes: 234, comments: []},
            {title: 'post 5', upvotes: 56, comments: []},
            {title: 'post 6', upvotes: 2, comments: []},
            {title: 'post 7', upvotes: 1, comments: []}
        ]
    };
    o.get = function(id) {
        return $http.get('/posts/'+id+'.json').then(function(response) {
            return response.data;
        });        
    };
    o.getAll = function() {
        return $http.get('/posts.json').then(function(response){
           angular.copy(response.data, o.posts); 
        });
    };
    o.create  = function(post) {
        return $http.post('/posts.json', post).then(function(response) {
           o.posts.push(response.data); 
        });
    };
    o.upvote = function(post) {
        return $http.put('/posts/' + post.id + '/upvote.json').then(function(response) {
            post.upvotes += 1;
        });
    };
    return o;
}]);
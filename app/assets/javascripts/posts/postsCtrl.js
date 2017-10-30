angular.module('handshakes')
.controller('PostsCtrl', [
    '$scope',
    'posts',
    'post',
    function($scope, posts, post) {
        $scope.post = post;
        
        $scope.addComment = function() {
            if (!$scope.author || !$scope.newComment) return;
    
            $scope.post.comments.push({
                author: $scope.author,
                upvotes: 0,
                body: $scope.newComment
            });
            $scope.author = "";
            $scope.newComment = "";
        };
        
        $scope.incrementUpvotes = function(comment) {
            comment.upvotes++;
        };
    }
]);
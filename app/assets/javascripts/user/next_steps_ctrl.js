angular.module('handshakes')
.controller('NextStepsCtrl', [
    '$scope',
    'skills',
    function($scope, skills) {
        $scope.skills = skills;
        
        // $scope.addComment = function() {
        //     if (!$scope.author || !$scope.newComment) return;
    
        //     $scope.post.comments.push({
        //         author: $scope.author,
        //         upvotes: 0,
        //         body: $scope.newComment
        //     });
        //     $scope.author = "";
        //     $scope.newComment = "";
        // };
        
        // $scope.incrementUpvotes = function(comment) {
        //     comment.upvotes++;
        // };
    }
]);
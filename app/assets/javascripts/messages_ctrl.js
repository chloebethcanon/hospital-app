/* global angular */

(function() {
  angular.module("app").controller("messagesCtrl", function($scope, $http) {
    $scope.setup = function() {
      $http.get('/api/v1/messages.json').then(function(response) {
        console.log(response.data);
        $scope.messages = response.data.messages;
        $scope.received_messages = response.data.received_messages;
        $scope.sent_messages = response.data.sent_messages;
      });
    };
    $scope.deleteMessage = function(inputMessage) {
      $http.delete('/api/v1/messages/' + inputMessage.id).then(function(response) {
        console.log(response);
        var index = $scope.received_messages.indexOf(inputMessage);
        $scope.received_messages.splice(index, 1);
      });
    };
    window.$scope = $scope;
  });
})();
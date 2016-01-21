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
    $scope.newMessage = function(inputBody) {
      var message = {
        body: inputBody
      };
      $http.post('/api/v1/messages.json', message).then(function(response) {
        console.log(response);
        $scope.messages.push(message);
        $scope.newMessageBody = "";
        $scope.errors = [];
      }, function(error) {
        console.log(error);
        $scope.errors = error.data.errors;
      });
    };

    $scope.replyMessage = function() {
      console.log($scope.newMessageBody, $scope.currentReplyMessage);
      var message = {
        body: $scope.newMessageBody,
        subject: "default",
        email: $scope.currentReplyMessage.sender_email
      };
      $http.post('/api/v1/messages.json', message).then(function(response) {
        console.log(response);
        $scope.messages.push(response.data);
        // $scope.newMessageBody = "";
        $scope.errors = [];
      }, function(error) {
        console.log(error);
        $scope.errors = error.data.errors;
      });
    };

    $scope.setCurrentReplyMessage = function(inputMessage) {
      $scope.currentReplyMessage = inputMessage;
    };
    
    window.$scope = $scope;
  });
})();
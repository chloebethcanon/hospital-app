/* global angular, $ */

(function() {
  angular.module("app").controller("pagesCtrl", function($scope, $http) {
    $scope.setup = function() {
      $scope.eventSources = [];

      $scope.uiConfig = {
        calendar:{
          contentHeight: 200,
          editable: true,
          header:{
            left: 'basicWeek month',
            center: 'title',
            right: 'today prev,next'
          },
          defaultView: 'basicWeek',
          dayClick: $scope.alertEventOnClick,
          eventDrop: $scope.alertOnDrop,
          eventResize: $scope.alertOnResize
        }
      };


      $http.get('/api/v1/events.json').then(function(response) {
        console.log(response.data);
        $scope.eventSources.push({
          events: response.data.registered_events,
          color: '#AC3270'
        });
        $scope.eventSources.push({
          events: response.data.owned_events,
          color: '#1C84C6'
        });
        $scope.eventSources.push({
          events: response.data.unregistered_events
        });
      });

      $http.get('/api/v1/messages.json').then(function(response) {
        console.log(response.data);
        $scope.messages = response.data.messages;
        $scope.received_messages = response.data.received_messages;
        $scope.sent_messages = response.data.sent_messages;
      });
      $scope.quantity = 3;
    };

    $scope.deleteMessage = function(inputMessage) {
      $http.delete('/api/v1/messages/' + inputMessage.id).then(function(response) {
        console.log(response);
        var index = $scope.messages.indexOf(inputMessage);
        $scope.messages.splice(index, 1);
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
        $scope.newMessageBody = "";
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
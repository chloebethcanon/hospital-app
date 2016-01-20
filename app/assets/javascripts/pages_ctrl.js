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
    };

    window.$scope = $scope;
  });
})();
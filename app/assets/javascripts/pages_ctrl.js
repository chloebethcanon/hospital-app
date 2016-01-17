/* global angular */

(function() {
  angular.module("app").controller("pagesCtrl", function($scope, $http) {
    $scope.setup = function() {

      $scope.uiConfig = {
        calendar:{
          height: 150,
          editable: true,
          header:{
            left: 'month basicWeek basicDay agendaWeek agendaDay',
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
        // $scope.events = response.data;
        // $scope.eventSources.events.splice(0, $scope.eventSources.events.length);
        $scope.eventSources.events = [{title: 'Test', start: '2016-01-19'}];
        // $('#calendar').fullCalendar('refetchEvents');
      });
      $scope.eventSources = {
        events: [
          {
            title: 'Event1',
            start: '2016-01-17'
          },
          {
            title: 'Event2',
            start: '2016-01-19'
          }
          // etc...
        ],
        color: 'yellow',   // an option!
        textColor: 'black' // an option!
      };
    };
    window.$scope = $scope;
  });
})();
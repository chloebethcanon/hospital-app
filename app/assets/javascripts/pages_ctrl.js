/* global angular, $ */

(function() {
  angular.module("app").controller("pagesCtrl", function($scope, $http) {
    $scope.setup = function() {
      $scope.eventSources = {};

      $scope.uiConfig = {
        calendar:{
          contentHeight: 200,
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
        $scope.eventSources = {
          events: response.data.all_events
          // color: 'yellow',   // an option!
          // textColor: 'black' // an option!
        };
        refreshCalendar();
      });
    };

    function refreshCalendar() {
      $('#calendar').fullCalendar('removeEvents');
      $('#calendar').fullCalendar('addEventSource', $scope.eventSources);
    }

    window.$scope = $scope;
  });
})();
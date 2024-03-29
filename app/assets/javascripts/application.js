// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require angular
//= require angular_sprinkles
//= require angular-rails-templates
//= require_tree ./templates
//= require_tree .

(function () {
  'use strict';

  sprinkles.directive('card', function(){
    return {
      scope: {
        title: '=',
        subtitle: '=',
        status: '=',
        id: '=',
        type: '='
      },
      replace: false,
      restrict: 'A',
      template:'<div class="card">'
            +     '<div class="body">'
            +       '<p class="title">{{ title }}</p>'
            +       '<p class="subtitle">{{ subtitle }}</p>'
            +     '</div>'
            +     '<div class="footer">'
            +       '<div class="left-icons">'
            +         '<a ng-if="isCourse" ng-href="/{{ classroomUrl }}">'
            +           '<i class="fa fa-users fw"></i>'
            +         '</a>'
            +         '<i class="fa fw" ng-class="statusIcon"></i>'
            +       '</div>'
            +       '<div class="right-icons">'
            +         '<a ng-href="/{{ Url }}">'
            +           '<i class="fa fa-pencil fw"></i>'
            +         '</a>'
            +         '<a data-method="delete" ng-href="/{{ Url }}">'
            +           '<i class="fa fa-trash fw"></i>'
            +         '</a>'
            +       '</div>'
            +     '</div>'
            +  '</div>',
      link: function($scope) {

        $scope.typeEnum = [ 'courses', 'students'];
        $scope.Url = buildUrl();
        $scope.isCourse = isCourse();
        $scope.classroomUrl = buildClassroomUrl();
        $scope.statusIcon = buildStatusIcon();

        function buildUrl() {
          return [$scope.typeEnum[$scope.type], $scope.id].join('/');
        }

        function isCourse() {
          return ($scope.type === 0) ? true : false;
        }

        function buildClassroomUrl() {
          return [$scope.typeEnum[$scope.type], $scope.id, 'classrooms'].join('/');
        }

        function buildStatusIcon() {
          return ($scope.status === 0) ? 'fa-toggle-off' : 'fa-toggle-on';
        }

      }
    };
  });

})()

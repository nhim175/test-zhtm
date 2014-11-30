app = angular.module 'app'

app.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise "/index"

  $stateProvider
    .state 'index',
      url: '/index'
      templateUrl: 'components/home/home.html'
      controller: 'HomeController'


app.controller 'HomeController', ($scope) ->
  $scope.text = 'Hello World'
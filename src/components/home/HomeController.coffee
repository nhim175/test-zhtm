app.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state 'index',
      abstract: true
      templateUrl: 'components/home/home.html'
      controller: 'HomeController'

app.controller 'HomeController', ['$scope', '$rootScope', '$document', '$timeout', 'User', 'Setting', ($scope, $rootScope, $document, $timeout, User, Setting) ->

]
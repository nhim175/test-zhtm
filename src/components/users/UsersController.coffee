app.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state 'index.users',
      url: '/users'
      templateUrl: 'components/users/index.html'
      controller: 'UsersController'

app.controller 'UsersController', ['$scope', '$rootScope', '$state', 'UserService', ($scope, $rootScope, $state, UserService) ->

  $state.go 'login' unless UserService.getCurrent()
  
]
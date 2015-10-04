app.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state 'index.users',
      url: '/users'
      templateUrl: 'components/users/index.html'
      controller: 'UsersController'

app.controller 'UsersController', ['$scope', '$rootScope', '$state', 'UserService', 'Users', ($scope, $rootScope, $state, UserService, Users) ->

  return $state.go 'login' unless UserService.getToken()

  $scope.users = Users.resource().query()
  
]
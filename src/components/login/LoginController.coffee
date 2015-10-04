app.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state 'login',
      url: '/login'
      templateUrl: 'components/login/login.html'
      controller: 'LoginController'

app.controller 'LoginController', ['$scope', '$rootScope', '$state', 'UserService', ($scope, $rootScope, $state, UserService) ->

  $scope.login = ->
    UserService.login $scope.username, $scope.password,
      success: (user) ->
        $state.go 'index.users'
  
]
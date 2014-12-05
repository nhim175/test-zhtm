app.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state 'login',
      templateUrl: 'components/login/login.html'
      controller: 'LoginController'

app.controller 'LoginController', ['$scope', '$rootScope', '$state', 'User', ($scope, $rootScope, $state, User) ->

  $scope.login = ->
    User.logIn $scope.username, $scope.password,
      success: (user) ->
        $state.go 'admin'
  
]
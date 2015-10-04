app.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state 'login',
      url: '/login'
      templateUrl: 'components/login/login.html'
      controller: 'LoginController'

app.controller 'LoginController', ['$scope', '$rootScope', '$state', 'User', ($scope, $rootScope, $state, User) ->

  $scope.login = ->
    User.login $scope.username, $scope.password,
      success: (user) ->
        $state.go 'index.users'
  
]
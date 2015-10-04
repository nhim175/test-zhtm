app.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state 'login',
      url: '/login'
      templateUrl: 'components/login/login.html'
      controller: 'LoginController'

app.controller 'LoginController', ['$scope', '$rootScope', '$state', 'UserService', ($scope, $rootScope, $state, UserService) ->

  $scope.login = ->
    UserService.login $scope.username, $scope.password,
      success: (response) ->
        data = response.data
        if data.status is 'success'
          UserService.setCurrent(data.user)
          UserService.setToken(data.token)
          $state.go 'index.users'
        else
          # TODO: show some cool message here to let the user know that he's failed
          $scope.username = ""
          $scope.password = ""
  
]
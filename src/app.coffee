app = angular.module 'app'

app.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise "/index"

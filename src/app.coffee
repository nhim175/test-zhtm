app = angular.module 'app'

app.config ($stateProvider, $urlRouterProvider, $locationProvider) ->

  $urlRouterProvider.otherwise "/users"

  $locationProvider.hashPrefix '!'
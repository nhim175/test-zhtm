app = angular.module 'app'

app.config ($stateProvider, $urlRouterProvider, $locationProvider, $disqusProvider) ->

  $urlRouterProvider.otherwise "/users"

  $locationProvider.hashPrefix '!'

  $disqusProvider.setShortname 'nhim175'
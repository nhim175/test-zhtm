app = angular.module 'app'

app.config ($stateProvider, $urlRouterProvider, $locationProvider, $disqusProvider) ->

  $urlRouterProvider.otherwise "/"

  $locationProvider.hashPrefix '!'

  $disqusProvider.setShortname 'nhim175'
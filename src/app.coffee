app = angular.module 'app'

app.config ($stateProvider, $urlRouterProvider, $locationProvider, $disqusProvider) ->

  $urlRouterProvider.otherwise "/blog"

  $locationProvider.hashPrefix '!'

  $disqusProvider.setShortname 'nhim175'
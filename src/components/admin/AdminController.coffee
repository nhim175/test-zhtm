app.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state 'admin',
      url: '/admin'
      templateUrl: 'components/admin/admin.html'
      controller: 'AdminController'

app.controller 'AdminController', ['$scope', '$rootScope', '$state', 'Category', 'User', ($scope, $rootScope, $state, Category, User) ->
  $state.go 'login' unless User.current()

  Category.Collection.fetch().then (collection) ->
    $scope.category = collection
    $rootScope.$broadcast 'category::fetched', collection
    $scope.$apply()
]
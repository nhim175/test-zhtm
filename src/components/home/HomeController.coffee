app.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state 'index',
      abstract: true
      templateUrl: 'components/home/home.html'
      controller: 'HomeController'
      resolve:
        categories: (Category) ->
          Category.Collection.fetch()

app.controller 'HomeController', ['$scope', '$rootScope', 'Category', 'categories', ($scope, $rootScope, Category, categories) ->
  $scope.category = categories

  $scope.offScreen = false
  
  $rootScope.$broadcast 'category::fetched', categories

  $scope.toggleOffScreen = -> $scope.offScreen = !$scope.offScreen
]
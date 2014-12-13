app.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state 'index',
      abstract: true
      templateUrl: 'components/home/home.html'
      controller: 'HomeController'
      resolve:
        categories: (Category) ->
          Category.Collection.fetch()

app.controller 'HomeController', ['$scope', '$rootScope', '$document', '$timeout', 'Category', 'categories', ($scope, $rootScope, $document, $timeout, Category, categories) ->
  $scope.category = categories

  $scope.offScreen = false
  
  $rootScope.$broadcast 'category::fetched', categories

  $scope.toggleOffScreen = -> 
    $scope.offScreen = !$scope.offScreen
    if $scope.offScreen is true
      handle_document_click = (event) ->
        if event.target instanceof HTMLInputElement
          return $document.one 'click', handle_document_click
        $scope.offScreen = false
        $scope.$apply()

      $timeout ->
        $document.one 'click', handle_document_click
      , 0
    return false

  FB.XFBML.parse();
]
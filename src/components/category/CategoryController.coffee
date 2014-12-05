app.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state 'index.category',
      url: '/category/:id'
      templateUrl: 'components/post/post.grid.html'
      controller: 'CategoryController'
      resolve:
        posts: ($stateParams, Post, Category) ->
          Post.Query.equalTo("category", Category.find $stateParams.id).find()

app.controller 'CategoryController', ['$scope', '$state', 'Post', 'Category', 'posts', 'categories', ($scope, $state, Post, Category, posts, categories) ->
  $scope.post = 
    models: posts
    
  $scope.category = categories

  $scope.getCategoryNameById = (id) -> Category.find(id).get('name')

  $scope.getCategoryColorById = (id) -> Category.find(id).get('color')

]
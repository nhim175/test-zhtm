app.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state 'index.category',
      url: '/category/:id'
      templateUrl: 'components/post/post.grid.html'
      controller: 'CategoryController'
      resolve:
        posts: ($stateParams, Post, Category, Setting) ->
          category = Category.find $stateParams.id
          Setting.setHeadTitle category.get('name')
          Post.Query.equalTo("category", category).find()

app.controller 'CategoryController', ['$scope', '$state', 'Post', 'Category', 'Setting', 'posts', 'categories', ($scope, $state, Post, Category, Setting, posts, categories) ->
  $scope.post = 
    models: posts
    
  $scope.category = categories

  $scope.getCategoryNameById = (id) -> Category.find(id).get('name')

  $scope.getCategoryColorById = (id) -> Category.find(id).get('color')

]
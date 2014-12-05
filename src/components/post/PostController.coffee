app.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider
    .state 'admin.posts',
      url: '/posts'
      templateUrl: 'components/post/post.admin.html'
      controller: 'PostController'

    .state 'admin.new-posts',
      url: '/posts/new'
      templateUrl: 'components/post/post.new.html'
      controller: 'PostController'

    .state 'index.home',
      url: '/blog'
      templateUrl: 'components/post/post.grid.html'
      controller: 'PostController'

    .state 'index.post',
      url: '/post/:id'
      templateUrl: 'components/post/post.single.html'
      controller: 'SinglePostController'
      resolve:
        post: ($stateParams, Post) ->
          Post.find($stateParams.id)

app.controller 'PostController', ['$scope', '$state', 'Post', 'Category', ($scope, $state, Post, Category) ->

  Post.Collection.fetch().then (collection) ->
    $scope.post = collection
    $scope.$apply()

  $scope.create = ->
    post = new Post.Object
    post.set 'title', $scope.title
    post.set 'content', $scope.content
    post.set 'category', $scope.categoryId
    post.save().then (result) ->
      $state.go 'admin.posts'

  $scope.getCategoryNameById = (id) -> Category.find(id).get('name')

  $scope.getCategoryColorById = (id) -> Category.find(id).get('color')
]

app.controller 'SinglePostController', ['$scope', '$stateParams', '$window', '$timeout', 'Post', 'Category', 'post', ($scope, $stateParams, $window, $timeout, Post, Category, post) ->

    $scope.post = post
    $scope.category = Category.find(post.get('category').id)

    $disqusResetTimeout = null
    $window.onresize = ->
      $timeout.cancel $disqusResetTimeout if $disqusResetTimeout
      $disqusResetTimeout = $timeout ->
        console.log 'resetting disqus'
        DISQUS.reset
          reload: yes
      , 1000
]
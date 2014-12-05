app.directive 'markdown', ->
  config =
    restrict: 'E',
    scope: 
      content: '='

    link: (scope, elem, attrs) ->
      elem.html markdown.toHTML scope.content
    
app.directive 'markdown', ($compile) ->
  config =
    restrict: 'E',
    scope: 
      content: '='

    link: (scope, elem, attrs) ->
      content = scope.content.replace /\[md\]([\s\S]*?)\[\/md\]/g, (str, m1) -> markdown.toHTML m1
      elem.html content
      $compile(elem.contents())(scope)

    
app.directive 'moment', ->
  config =
    restrict: 'E',
    scope: 
      format: '='
      time: '='

    link: (scope, elem, attrs) ->
      elem.html moment(scope.time).format scope.format
    
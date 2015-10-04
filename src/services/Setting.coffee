app.factory 'Setting', ->
  title = "Thinh Pham's Blog"

  # TODO: All these configs should come from server
  return {
    blogTitle: -> title
    setHeadTitle: (_title) -> angular.element('title').html(title + ' - ' +  _title)
    apiURL: -> 'http://localhost:3001'
  }

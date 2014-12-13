app.factory 'Setting', ->
  title = "Thinh Pham's Blog"
  return {
    blogTitle: -> title
    setHeadTitle: (_title) -> angular.element('title').html(title + ' - ' +  _title)
  }

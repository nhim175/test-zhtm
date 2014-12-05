app.factory 'Category', ['$rootScope', ($rootScope) ->
  list = null

  Category = Parse.Object.extend 'Category'

  CategoryCollection = Parse.Collection.extend 
    model: Category

  categoryCollection = new CategoryCollection
  categoryCollection.comparator = (c) -> c.get('id')

  $rootScope.$on 'category::fetched', (event, data) ->
    list = data

  find = (id) ->
    for c in list.models 
      if c.id is id then return c

  return {
    Object: Category
    Collection: categoryCollection
    find: find
  }
]
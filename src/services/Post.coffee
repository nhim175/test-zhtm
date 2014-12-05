app.factory 'Post', ->

  Post = Parse.Object.extend 'Post'

  PostCollection = Parse.Collection.extend 
    model: Post

  postCollection = new PostCollection
  postQuery = new Parse.Query Post
  postCollection.comparator = (c) -> c.get('createdAt')

  find = (id) ->
    new Parse.Query(Post).get(id)

  return {
    Object: Post
    Collection: postCollection
    Query: postQuery
    find: find
  }

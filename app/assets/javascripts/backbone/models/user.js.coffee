class Suite101.Models.User extends Backbone.Model
  paramRoot: 'user'

  defaults:
    email: ''
    name: ''

class Suite101.Collections.UsersCollection extends Backbone.Collection
  model: Suite101.Models.User
  url: '/users'

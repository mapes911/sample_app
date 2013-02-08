class Suite101.Routers.UsersRouter extends Backbone.Router
  initialize: (options) ->
    @users = new Suite101.Collections.UsersCollection()
    @users.reset options.users

  routes:
    "new"      : "newUser"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newUser: ->
    @view = new Suite101.Views.Users.NewView(collection: @users)
    $("#users").html(@view.render().el)

  index: ->
    @view = new Suite101.Views.Users.IndexView(users: @users)
    $("#users").html(@view.render().el)

  show: (id) ->
    user = @users.get(id)

    @view = new Suite101.Views.Users.ShowView(model: user)
    $("#users").html(@view.render().el)

  edit: (id) ->
    user = @users.get(id)

    @view = new Suite101.Views.Users.EditView(model: user)
    $("#users").html(@view.render().el)

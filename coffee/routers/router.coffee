define [
  'backbone'
  'views/app'
  'views/menu'
  'views/pages/index'
  'views/admin/index'
], (
  Backbone
  App
  Menu
  PagesIndex
  AdminIndex
) ->

  ###*
   * Backboneのrouter
   *
   * @class Workspace
   * @extend Backbone.Router
   * @constructor
   * @return {Class} Workspace
   * @uses Backbone.Router
   * @uses views/app
   * @uses views/menu
   * @uses views/pages/index
   * @uses views/admin/index
  ###
  class Workspace extends Backbone.Router

    initialize: ->
      @app       = new App()
      @menu      = new Menu()

    routes:
      events =
        '':         'index'
        'admin/':   'admin'

    index: ->
      @app.loaded.index = new PagesIndex()
      @app.loaded.index.render()

    admin: ->
      @app.loaded.index = new AdminIndex()
      @app.loaded.index.render()

  return Workspace

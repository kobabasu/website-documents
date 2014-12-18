define [
  'views/app'
], (
  App
) ->
  class Admin extends App
    pVent: _.extend {}, Backbone.Events

    ###*
     * pages全体の共通プロパティ
     *
     * @property admin
     * @public
     * @type {Object}
    ###
    admin:
      id:       NaN
      name:     undefined

    ###*
     * 初期化
     *
     * @property pages
     * @public
     * @type {Object}
    ###
    initialize: ->
      @events = _.extend @events, App::events

    ###*
     * mainのclassをdefaultに
     *
     * @property render
     * @public
     * @type {Object}
    ###
    render: ->
      $('#main').attr('class','admin')

    ###*
     * - mixinしたeventsを削除
     * - Appのunloadを呼び出す
     *
     * @method unload
     * @public
     * @return void
    ###
    unload: ->
      @pVent.stopListening()
      super

  return Admin

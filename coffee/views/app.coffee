define [
  'backbone'
  'retina'
], (
  Backbone
  Retina
) ->

  ###*
   * - 全体のセッティング
   *
   * @class App
   * @extend Backbone.View
   * @constructor
   * @return {Class} App
   * @uses Backbone.View
   * @uses vendor/retina
   * @extensionfor router.initialize
  ###
  class App extends Backbone.View

    ###*
     * App全体の共通イベント
     *
     * @property gVent
     * @public
     * @type {Object}
    ###
    gVent: _.extend {}, Backbone.Events

    ###*
     * App全体の共通イベント
     *
     * @property loaded
     * @public
     * @type {Object}
    ###
    loaded: new Object()

    ###*
     * App全体の共通プロパティ
     *
     * @property global
     * @public
     * @type {Object}
    ###
    global: new Object()

    ###*
     * eventの設定
     *
     * @event events
     * @public
    ###
    events:
      events = ''

    ###*
     * - イベントをセット
     * - Login.check()が成功したらsetCookieを実行
     *
     * @method setEvents
     * @public
     * @return void
    ###
    setEvents: ->
      @gVent.listenTo @gVent, 'setCookie', (obj) =>
        @setCookie(obj)

    ###*
     * - 初期設定
     *
     * @method initialize
     * @public
     * @return void
    ###
    initialize: ->
      @setEvents()

    ###*
     * - aタグの機能を無効化
     * - csvのpathは実行しない
     * - fragmentが一緒の場合は実行しない
     * - Backbone.router経由で遷移
     *
     * @method changeRoot
     * @public
     * @param e {event} eventsから
     * @return void
    ###
    changeRoot: (e) ->
      exception = [
        "pathto/exception"
      ]
      href = $(e.target).attr('href')
      e.preventDefault()
      if href not in exception
        e.preventDefault()
        if (Backbone.history.fragment != href)
          @unload()
        Backbone.history.navigate(href, true)
      else
        location.href = href

    ###*
     * - loadedに追加されたインスタンスを削除
     *
     * @method unload
     * @public
     * @return void
    ###
    unload: ->
      _.each @loaded, (page, key) =>
        page.undelegateEvents()
        page.remove()
        delete @loaded[key]

  return App

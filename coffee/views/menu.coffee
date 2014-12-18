define [
  'views/app'
  'text!templates/menu.html'
], (
  App
  Tmpl
) ->

  ###*
   * - 画面上部のメニューのクラス
   * - メニューの内容はlist内に記述
   * - menu.htmlを読み込み
   *
   * @class Menu
   * @extend App
   * @constructor
   * @return {Class} Menu
   * @uses App
   * @uses templates/menu.html
   * @extensionfor Router
  ###
  class Menu extends App

    ###*
     * 生成するタグ
     *
     * @property tagName
     * @public
     * @type {String}
     * @default nav
    ###
    tagName: 'nav'

    ###*
     * 生成するタグ
     *
     * @property el
     * @public
     * @type {String}
     * @default #menu
    ###
    id: '#menu'

    ###*
     * menuを設定
     *
     * @property list
     * @private
     * @static
     * @type {Object}
     * @default list
    ###
    list =
      menu: [
        { name: "home", url: "/" }
        { name: "admin", url: "/admin/" }
      ]

    ###*
     * - events
     *
     * @event events
     * @public
    ###
    events:
      'click a': 'changeRoot'

    ###*
     * - 初期化
     *
     * @method initialize
     * @public
     * @return void
    ###
    initialize: ->
      @render()

    ###*
     * - render
     *
     * @method render
     * @public
     * @return void
    ###
    render: ->
      tmpl = _.template Tmpl, list['menu']
      $('h1').after $(@el).html(tmpl)

  return Menu

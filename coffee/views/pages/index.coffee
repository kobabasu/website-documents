define [
  'views/pages'
  'text!templates/pages/index.html'
], (
  Pages
  Tmpl
) ->

  ###*
   * - indexを生成
   *
   * @class Index
   * @extends Pages
   * @constructor
   * @return void
  ###
  class Index extends Pages

    ###*
     * 生成するタグ
     *
     * @property tagName
     * @public
     * @type {String}
     * @default div
    ###
    tagName: 'div'

    ###*
    * 生成するdomのid
     *
     * @property id
     * @public
     * @type {String}
     * @default index
    ###
    id: 'index'

    ###*
     * - イベントの設定
     *
     * @event events
     * @public
    ###
    events: new Object()

    ###*
     * - initialize
     *
     * @method initialize
     * @public
     * @return void
    ###
    initialize: ->
      @tmpl = _.template Tmpl
      super

    ###*
     * - main画面に生成したdivをappend
     * - テンプレートの読み込み
     *   templates/pages/index.html
     *
     * @method render
     * @public
     * @return void
    ###
    render: ->
      super
      @$el.html @tmpl
      $('#main').append @el

  return Index

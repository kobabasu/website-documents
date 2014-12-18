define [
  'views/menu'
], (
  Menu
) ->
  describe 'views/menu', () ->

    el: new Object()

    before ->
      cls = new Menu()
      cls.render()
      @el = cls.el

    describe 'expressions', () ->
      it '先頭がhomeであること', ->
        t = $('ul>li:first-child a',@el).text()
        expect(t).to.eq('home')

      it '2つ目がadminであること', ->
        t = $('ul>li:nth-of-type(2) a',@el).text()
        expect(t).to.eq('admin')

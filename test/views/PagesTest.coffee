define [
  'views/pages'
], (
  Pages
) ->
  describe 'views/pages', () ->

    describe 'events', () ->
      it 'views/pages should have events property', ->
       pages = new Pages()
       pages.should.have.property('events')

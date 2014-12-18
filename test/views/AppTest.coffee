define [
  'views/app'
], (
  App
) ->
  describe 'views/app', () ->

    describe 'events', () ->
      it 'views/app should have events property', ->
       app = new App()
       app.should.have.property('events')

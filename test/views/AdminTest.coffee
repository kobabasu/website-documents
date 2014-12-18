define [
  'views/admin'
], (
  Admin
) ->
  describe 'views/admin', () ->

    describe 'events', () ->
      it 'views/admin should have events property', ->
       admin = new Admin()
       admin.should.have.property('events')

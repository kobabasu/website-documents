define [
  'views/admin/index'
], (
  Index
) ->
  describe 'views/admin/index', () ->

    describe 'events', () ->
      it 'views/admin/index should have events property', ->
       index = new Index()
       index.should.have.property('events')

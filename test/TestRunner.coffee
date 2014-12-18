specs = [
  '../../test/views/AppTest'
  '../../test/views/AdminTest'
  '../../test/views/PagesTest'
  '../../test/views/admin/IndexTest'
  '../../test/views/pages/IndexTest'
]

define [
  'chai'
  'chai-jquery'
  'sinon'
  'sinon-chai'
  'mocha'
], (
  chai
  chaiJquery
  sinon
  sinonChai
) ->
  TestRunner = ->
    should = chai.should()
    chai.use(chaiJquery)
    chai.use(sinonChai)

    mocha.setup('bdd')
  
    require specs, ->
      mocha.run()

  return TestRunner

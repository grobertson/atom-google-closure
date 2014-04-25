AtomGoogleClosureView = require './atom-google-closure-view'

module.exports =
  atomGoogleClosureView: null

  activate: (state) ->
    @atomGoogleClosureView = new AtomGoogleClosureView(state.atomGoogleClosureViewState)

  deactivate: ->
    @atomGoogleClosureView.destroy()

  serialize: ->
    atomGoogleClosureViewState: @atomGoogleClosureView.serialize()

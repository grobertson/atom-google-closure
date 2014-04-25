{View} = require 'atom'

module.exports =
class AtomGoogleClosureView extends View
  @content: ->
    @div class: 'atom-google-closure overlay from-top', =>
      @div "The AtomGoogleClosure package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "atom-google-closure:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "AtomGoogleClosureView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)

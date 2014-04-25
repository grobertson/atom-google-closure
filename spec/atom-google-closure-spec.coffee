{WorkspaceView} = require 'atom'
AtomGoogleClosure = require '../lib/atom-google-closure'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "AtomGoogleClosure", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('atom-google-closure')

  describe "when the atom-google-closure:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.atom-google-closure')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'atom-google-closure:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.atom-google-closure')).toExist()
        atom.workspaceView.trigger 'atom-google-closure:toggle'
        expect(atom.workspaceView.find('.atom-google-closure')).not.toExist()

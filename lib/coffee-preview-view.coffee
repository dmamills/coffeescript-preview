coffee = require 'coffee-script'
{ScrollView} = require 'atom'

module.exports =
class CoffeePreviewView extends ScrollView
  @content: ->
    @div class: 'markdown-preview native-key-bindings', tabindex: -1

  initialize: (serializeState) ->
    atom.workspaceView.command "coffee-preview:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    if @hasParent()
      @detach()
    else
      editor = atom.workspace.getActiveEditor()
      return unless editor?

      prevActivePane = atom.workspace.getActivePane()
      uri = 'coffee-preview://output.js'
      atom.workspace.open(uri,split:'right').done (createdEditor)->
        content = editor.getText()
        output = coffee.compile(content)
        createdEditor.setText(output)

CoffeePreviewView = require './coffee-preview-view'

module.exports =
  coffeePreviewView: null

  activate: (state) ->
    @coffeePreviewView = new CoffeePreviewView(state.coffeePreviewViewState)

  deactivate: ->
    @coffeePreviewView.destroy()

  serialize: ->
    coffeePreviewViewState: @coffeePreviewView.serialize()

  show: ->
     return

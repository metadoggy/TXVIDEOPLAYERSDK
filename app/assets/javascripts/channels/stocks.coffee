App.stocks = App.cable.subscriptions.create "StocksChannel",
  connected: ->
    # Called whe
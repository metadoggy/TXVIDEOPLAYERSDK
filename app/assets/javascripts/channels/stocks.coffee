App.stocks = App.cable.subscriptions.create "StocksChannel",
  connected: ->
    # Called when the subscription is ready for use on
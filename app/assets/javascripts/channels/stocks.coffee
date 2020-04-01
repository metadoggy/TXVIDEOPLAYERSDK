App.stocks = App.cable.subscriptions.create "StocksChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    unless @callbackSet  # set a callback to listen to the new stream after every page change.
      $(document).on 'turbolinks:load', -> App.stocks.follow()
      @callbackSet = true
    @follow() # Call follow the initial time.

  d
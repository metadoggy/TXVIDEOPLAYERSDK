
# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class StocksChannel < ApplicationCable::Channel
  def subscribed # Default stream removed
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def follow( data ) # Added data variable
    stream_from "stock_stream:#{data['stock']}" # Added specific stock stream
  end

  def unfollow_all
    stop_all_streams # Added call to 'stop_all_streams'
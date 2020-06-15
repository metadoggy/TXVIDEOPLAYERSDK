
class Stock < ApplicationRecord
  validates_format_of :symbol, with: /\A[A-Za-z0-9]+\Z/, message: "can only contain letters and numbers"
  validates :symbol, uniqueness: true

  after_commit :broadcast, on: :update

  def broadcast
    ActionCable.server.broadcast( "stock_stream:#{symbol}",  { symbol: symbol, price: price.to_f } ) # Added specific stock broadcast
    ActionCable.server.broadcast( "stock_stream:all_stocks", { symbol: symbol, price: price.to_f } )
  end
end

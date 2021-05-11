class Stock < ApplicationRecord

  def self.new_lookup ticker_symbol
    begin
      client = IEX::Api::Client.new()
      new(ticker_symbol: ticker_symbol, 
          name: client.company(ticker_symbol).company_name,
          last_price: client.price(ticker_symbol))
    rescue
    end
  end
end

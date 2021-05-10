class CustomersController < ApplicationController
  def index

  end

  def my_portfolio
    puts ENV['IEX_API_SECRET_TOKEN']
  end
end

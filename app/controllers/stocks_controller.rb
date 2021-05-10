class StocksController < ApplicationController
  def search
    unless params[:stock].blank?
      @stock = Stock.new_lookup params[:stock] 
      if @stock
        respond_to do |format|
          format.js { render partial: 'customers/search_results' }
        end
      else
        respond_to do |format|
          flash.now[:notice] = 'please enter a valid symbol' 
          format.js { render partial: 'customers/search_results' }
        end
      end
    else
      respond_to do |format|
        flash.now[:notice] = 'please enter symbol to search'
        format.js { render partial: 'customers/search_results' }
      end
    end

  end
end

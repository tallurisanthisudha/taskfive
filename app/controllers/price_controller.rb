class PriceController < ApplicationController

    require "net/http"
    
  
    def index

        @prices = Price.all
        uri = URI('https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd')

        request = Net::HTTP.get(uri)
        
        @price = JSON.parse(request) ["bitcoin"] ["usd"]
    
    end

    def new
        
        @price = Price.new
    end
    
    def create
        
        @price = Price.new(price_params)
        binding.pry

    
        if @price.save!
          redirect_to prices_url
        else
          render :new, status: :unprocessable_entity
          flash[:notice] = "A price has been saved."
        end
    end

    private
        def price_params
          params.require(:price).permit(:bitcoin_price)
        end
end

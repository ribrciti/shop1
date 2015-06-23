class CartController < ApplicationController
	def add
		id = params[:id]
		# If the cart has already been created, use the existing cart else create a new cart
		if session[:cart] then
			cart = session[:cart]
		else
			session[:cart] = {}
			cart = session[:cart]
		end
		# If the product hs already been added to the cart, increment the value else set the 
		if cart[id] then
			cart[id] = cart[id] + 1
		else
			cart[id] = 1
		end
		redirect_to :action => :index
	end

	def clearCart
		session[:cart] = nil
		redirect_to :action => :index
	end

  def index
  # If there is a cart, pass it to the page for display else pass and empty value
  	if session[:cart] then
  		@cart = session[:cart]
  	else
  		@cart = {}
  	end
	end
end


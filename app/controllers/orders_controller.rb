class OrdersController < ApplicationController

  def new
    @product = Product.find(params[:product_id])

    Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)
      @session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
        name: @product.name,
        description: "Product from #{@product.farmer}",
        amount: (@product.price * 100).to_i,
        currency: 'aud',
        quantity: 1,
        }],
        
        success_url: "#{root_url}orders/complete?item=#{@product.id}",
        cancel_url: "#{root_url}"
      )
      
  end

  # after transaction completed
  def complete
    @product_number = params[:item]
    OrderHistory.create(user_id: current_user.id, product_id: @product_number.to_i)
    @products = current_user.order_history
  end

end

class OrdersController < ApplicationController
  def new
    @product = Product.find(params[:product_id])

    Stripe.api_key = 'sk_test_ZlBaF8I7L58ScoK4nwY2muBw00L5onR2Hu'
      @session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
        name: @product.name,
        description: "Product from #{@product.farmer}",
        amount: (@product.price * 100).to_i,
        currency: 'aud',
        quantity: 1,
        }],
      success_url: 'http://localhost:3000/orders/complete',
      cancel_url: 'http://localhost:3000/',
      )
  end
end

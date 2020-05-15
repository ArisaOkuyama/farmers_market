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
      success_url: "https://google.com",
      cancel_url: 'http://localhost:3000/',
      metadata: {product_id: @product.id}
      )

      OrderHistory.create(user: current_user, product: @product)
  end

  def complete
    @orders = OrderHistory.find_by(user_id: current_user.id)
  end

end

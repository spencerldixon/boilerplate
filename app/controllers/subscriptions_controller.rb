class SubscriptionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:pricing]

  def index
    # Render a users billing portal
    @portal_session = current_user.payment_processor.billing_portal
  end

  def new
  end

  def checkout
    if params[:price_id]
      # Make sure the user's payment processor is Stripe
      current_user.set_payment_processor :stripe

      # Build checkout session with price
      @checkout_session = current_user.payment_processor.checkout(
        mode: "subscription",
        locale: I18n.locale,
        allow_promotion_codes: true,
        line_items: [{
          price: params[:price_id],
          quantity: 1
        }],
        success_url: root_url,
        cancel_url: subscriptions_new_url,
        automatic_tax: {enabled: true},
        customer_update: {address: "auto"}
      )

      # Redirect to checkout
      redirect_to @checkout_session.url, allow_other_host: true, status: :see_other
    else
      redirect_to root_path, notice: "Something went wrong, please try again"
    end
  end
end

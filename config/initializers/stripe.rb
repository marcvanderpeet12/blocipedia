Rails.configuration.stripe = {

  :publishable_key => 'pk_test_Gl3BF0sG3c9GtpKJGj0icbTO',
  :secret_key      => 'sk_test_URA3A6ieIkMujq21xsJ4DoIH'

}

 Stripe.api_key = Rails.configuration.stripe[:secret_key]
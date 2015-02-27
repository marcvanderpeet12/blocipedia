class ChargesController < ApplicationController 



 def create

  @user = current_user

   @amount = params[:amount]
   #this is the amount you fetch!
   # Creates a Stripe Customer object, for associating
   # with the charge
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )
 
   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     #this is the amount youre charging!
     amount: 500,
     description: "BigMoney Membership - #{current_user.email}",
     currency: 'usd'
   )


    #updating the role of the user after payment!
    unless @user.role == "administrator"
      @user.update_attributes(role: "premium")
      @user.save
    end
 
   flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
   redirect_to wikis_path # or wherever
 
 # Stripe will send back CardErrors, with friendly messages
 # when something goes wrong.
 # This `rescue block` catches and displays those errors.
 rescue Stripe::CardError => e
   flash[:error] = e.message
   redirect_to new_charge_path
 end

  def new
   @stripe_btn_data = {
     key: Rails.configuration.stripe[:publishable_key],
     description: "BigMoney Membership - #{current_user.email}",
     amount: 500
   }
 end
 
end
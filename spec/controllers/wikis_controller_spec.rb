require 'rails_helper'

describe WikisController do
  include Devise::TestHelpers

  before do
    @user = build(:user)
    #to be created!
    # @wiki = build(:wiki)
    visit root_path
     click_link ('Sign In')
     fill_in 'Email', with: @user.email
     fill_in 'Password', with: @user.password
     click_button ('Log in')
  end

  describe "#create" do
    @user = build(:user)
    #to be created!
    # @wiki = build(:wiki)
    visit root_path
     click_link ('Sign In')
     fill_in 'Email', with: @user.email
     fill_in 'Password', with: @user.password
     click_button ('Log in')
    expect(@user.votes).to be_nil
   # post :create, {wiki_id: @wiki.id}
  end

  describe "#destroy" do
    # delete :destroy, {wiki_id: @wiki.id}
  end


  # wiki :create, {user_id: user.id}
  #  expect {@user.wikis}.to be (1)

  # wiki :delete, {user_id: user.id}
  #  expect {@user.wikis}.to be (1)
  

end

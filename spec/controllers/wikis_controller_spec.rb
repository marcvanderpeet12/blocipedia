require 'rails_helper'

describe WikisController do
  include Devise::TestHelpers

  before do
    @user = create(:user)
    # @wiki = build(:wiki)

     sign_in @user     
  end

  describe "#create" do
   expect(@user.votes).to be_nil
   # post :create, {wiki_id: @wiki.id}
    # expect {@user.wikis}.to be (1)
  end

  describe "#destroy" do
    # delete :destroy, {wiki_id: @wiki.id}
     # expect {@user.wikis}.to be (1)
  end


  

end

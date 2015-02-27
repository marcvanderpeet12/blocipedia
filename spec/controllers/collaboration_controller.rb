require 'rails_helper'

describe CollaborationController do

  before do
  end

  describe "#create" do
   expect(@user.collaborations).to be_nil
   post :create, {wiki_id: @wiki.id}
    expect {@user.wikis}.to be (1)
  end
  
end
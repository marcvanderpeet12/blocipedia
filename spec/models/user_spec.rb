require 'rails_helper'

describe 'user-method' do
  before do
    @user = create(:user)
  end

  describe '#change_role_method' do
    it "changes the role of the user" do
      expect(@user.administrator?).to eq(false)
      @user.update_attribute(:role, "administrator")
      expect(@user.administrator?).to eq(true)
    end
  end

  describe '#set_role_method' do
    it "changes the default role of the user to basic_member" do
      expect(@user.basic_member?).to eq(true)
    end
  end

end
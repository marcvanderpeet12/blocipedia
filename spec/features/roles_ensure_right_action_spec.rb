require 'rails_helper'


 feature 'Users have the right access' do
  before do
   @user = create(:user)
   visit root_path
   click_link ('Sign In')
   fill_in 'Email', with: @user.email
   fill_in 'Password', with: @user.password
   click_button ('Log in')
  end
  
  scenario 'Basic members cant create new wiki' do
   visit new_wiki_path
    expect( page ).not_to have_content('New wiki')
   end
  
  scenario 'administrators can create wiki' do
    @user.update_attribute(:role, "administrator")
    visit new_wiki_path

    expect( page ).to have_content('New wiki')

   end
 end
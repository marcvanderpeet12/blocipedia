require 'rails_helper'


 feature 'People can create public wikis' do
  before do
   @user = create(:user)
   visit root_path
   click_link ('Sign In')
   fill_in 'Email', with: @user.email
   fill_in 'Password', with: @user.password
   click_button ('Log in')
  end
  
  scenario 'People successfull create wiki' do
   visit new_wiki_path
   fill_in 'Title', with: "This is the title"
   fill_in 'Body', with: "This is the body"
   click_button ('Save')

    expect( page ).to have_content('You successfully created a wiki!')
    expect( @user.wikis.count).to eq (1)
   end
  
  scenario 'People do not successfully create wiki' do
    visit new_wiki_path
     fill_in 'Title', with: "This"
     fill_in 'Body', with: "This is the body"
     click_button ('Save')

    expect( page ).to have_content('There was an error saving the wiki. Please try again.')
    expect( @user.wikis.count).to eq (0)

   end
 end
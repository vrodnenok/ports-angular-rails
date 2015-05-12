require 'spec_helper'
# require 'Factories'

feature 'Authentication', js: true do 
  
  before do
    @user = FactoryGirl.create(:user)
    visit ('#/signin')
    @login_page = LoginPage.new
    @login_page.sign_in(@user.email, @user.password)
  end

  feature 'login' do
    scenario 'with valid data' do
      expect(page).to have_content('Sign out')
    end
  end

end
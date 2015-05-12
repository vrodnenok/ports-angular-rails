require 'spec_helper'

feature 'User registration', js:true do 
  scenario 'With valid inputs' do
    visit '/signup'
    email, password = Faker::Internet.email, Faker::Internet.password
    fill_in "First name", with: "Victor"
    fill_in "Last name", with: "Rodnenok"
    fill_in "Email", with: email
    fill_in "password", with: password
    fill_in "Password confirmation", with: password
    click_on "Register"

    login_page = LoginPage.new
    login_page.visit
    login_page.signin(email, password)
    expect(page).to_have content "Sign Out"
  end
end
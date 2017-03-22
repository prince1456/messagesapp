require "rails_helper"
include Warden::Test::Helpers
Warden.test_mode!

# Feature: User index page
#   As a user
#i want to see my user in users list 

feature 'User index page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User can see his email in the in the users_path
  scenario 'user sees own email address' do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    visit users_path
    expect(page).to have_content user.email
  end

end

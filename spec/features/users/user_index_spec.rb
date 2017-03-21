require "rails_helper"
include Warden::Test::Helpers
Warden.test_mode!

# Feature: User index page
#   As a user
#   I want to see a list of users
#   So I can see who has registered
feature 'User index page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User can see his email in the in the users_path
  scenario 'user sees own email address' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit users_path
    expect(page).to have_content user.email
  end

end

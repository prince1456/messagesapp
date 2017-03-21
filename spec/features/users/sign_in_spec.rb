require 'rails_helper'

feature 'Sign in', :devise do
  let(:user) {FactoryGirl.create :user}

  # let(:user2) {FactoryGirl.create :user}
  # Scenario is I filled inputs with a user wich is not registered and its should give me faild
  scenario 'user cannot sign in if not registered' do
    visit new_user_session_path
    signin("ali@fasfash.com", "asfa1ewr")
    expect(page).to have_content("Invalid Email or password.")
  end

  scenario 'user can sign in with valid credentials' do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
  end

  # Scenario: User cannot sign in with wrong email
  # im gonna made a user and then sign in with wrong information
  scenario 'user cannot sign in with wrong email and password' do
    user = FactoryGirl.create(:user)
    signin('invalid@email.com', "jfjalsfjlas")
    expect(page).to have_content("Invalid Email or password.")
  end


end

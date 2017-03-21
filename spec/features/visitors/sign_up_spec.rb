require 'rails_helper'
# im trying to check the signup form with diffrent Scenario

feature 'Sign Up', :devise do

  #Scenario is about sign up with valid information
  scenario 'visitor can sign up with valid email address and password' do
    sign_up_with('test@example.com', 'please123', 'please123')
    txts = [I18n.t( 'devise.registrations.signed_up'), I18n.t( 'devise.registrations.signed_up_but_unconfirmed')]
    expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
  end

  # scenario is about checking signup form with invalid email address and check validation is work or not
  # first im opening sign up form then fill out the form with invalid information

  scenario 'visitor cannot sign up with invalid email address' do
    sign_up_with('bogus', 'please123', 'please123')
    expect(page).to have_content 'Please review the problems below:'
  end

  #Scenario is about checking signup form with blank password
  # im filling password and confirmation input with blank password
  scenario 'visitor cannot sign up without password' do
    sign_up_with('test@example.com', '', '')
    expect(page).to have_content "6 characters minimum"
  end

# scenario is about checking sign up form with short password
  scenario 'visitor cannot sign up with a short password' do
    sign_up_with('test@example.com', '123', '123')
    expect(page).to have_content "is too short (minimum is 6 characters)"
  end

#scenario is about checking signup form with if i fill it with diffrent password and confirmation is it work or not?
  scenario 'visitor cannot sign up without password confirmation' do
    sign_up_with('test434@example.com', '123456', '')
    expect(page).to have_content "doesn't match Password"
  end

  # Scenario is about visitor can not sign up with mismatched password and confirmation
  scenario 'visitor cannot sign up with mismatched password and confirmation' do
    sign_up_with('test@example.com', 'please123', 'mismatch')
    expect(page).to have_content "doesn't match Password"
  end

end

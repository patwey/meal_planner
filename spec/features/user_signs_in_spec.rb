require 'rails_helper'

RSpec.describe 'User signs in' do
  let!(:user) { create(:user, email: 'test@example.com', password: 'password') }

  scenario 'they are signed in' do
    visit sign_in_path

    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    expect(page).to have_content 'Sign out'
    expect(page).to have_content user.name
  end
end

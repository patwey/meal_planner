require 'rails_helper'

RSpec.describe 'User signs out' do
  let!(:user) { create(:user) }

  before { sign_in user }

  scenario 'they are signed out' do
    visit user_path(user)

    click_link 'Sign out'

    expect(page).to have_content 'Signed out successfully'
    expect(page).to have_link 'Sign in'
  end
end

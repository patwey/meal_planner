require 'rails_helper'

RSpec.describe 'User deletes account' do
  let(:user) { create(:user) }

  before { sign_in user }

  scenario 'their account is deleted' do
    visit user_path(user)

    click_link 'Delete account'
    click_button 'Yes, delete my account'

    expect(page).to have_content 'Your account has been successfully deleted'
  end
end

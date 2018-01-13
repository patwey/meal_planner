# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User edits profile' do
  let(:user) { create(:user) }

  before { sign_in user }

  scenario 'their profile is updated' do
    visit edit_user_path(user)

    fill_in 'Name', with: 'My new name'
    fill_in 'Password', with: 'password'
    click_button 'Save changes'

    expect(page).to have_content 'Your profile has been updated'
  end
end

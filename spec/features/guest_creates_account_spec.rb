# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Guest creates account' do
  scenario 'they are signed in' do
    visit sign_up_path

    fill_in 'Name', with: 'Pat'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content 'Sign out'
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User visits sign in' do
  let(:user) { create(:user) }

  before { sign_in user }

  scenario 'they are redirected to their profile with a link to sign out' do
    visit sign_in_path

    within '.flashes' do
      expect(current_path).to eq user_path(user)
      expect(page).to have_link 'Sign out'
    end
  end
end

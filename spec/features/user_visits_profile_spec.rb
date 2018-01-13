# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User visits profile' do
  let(:user) { create(:user) }

  before { sign_in user }

  scenario 'they see their information' do
    visit user_path(user)

    expect(page).to have_content user.name
  end
end

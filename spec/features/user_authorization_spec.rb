# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User authorization' do
  let(:user) { create(:user) }

  before { sign_in user }

  scenario 'they get an unauthorized message' do
    other_user = create(:user)

    visit edit_user_path(other_user)

    expect(page).to have_content 'not authorized'
  end
end

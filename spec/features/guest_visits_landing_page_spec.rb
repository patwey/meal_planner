# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Guest visits landing page' do
  scenario 'they see links to sign up and sign in' do
    visit root_path

    expect(page).to have_link 'Sign up'
    expect(page).to have_link 'Sign in'
  end
end

# frozen_string_literal: true

module Features
  def sign_in(user)
    visit sign_in_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    user
  end
end

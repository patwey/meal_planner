# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:new_user) { build(:user) }

  it { is_expected.to validate_presence_of :name }

  it { is_expected.to validate_length_of(:name).is_at_most(50) }

  it { is_expected.to validate_presence_of :email }

  it { is_expected.to validate_uniqueness_of :email }

  it { is_expected.to have_secure_password }

  it 'validates email format' do
    new_user.email = 'test.com'

    expect(new_user).not_to be_valid
  end
end

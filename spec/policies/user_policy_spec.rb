require 'rails_helper'

RSpec.describe UserPolicy do
  subject { described_class.new(user, record) }

  let(:record) { create(:user) }

  context 'for a guest' do
    let(:user) { nil }

    it { is_expected.not_to permit(:index) }
    it { is_expected.not_to permit(:show) }
    it { is_expected.to permit(:new) }
    it { is_expected.not_to permit(:edit) }
    it { is_expected.to permit(:create) }
    it { is_expected.not_to permit(:update) }
    it { is_expected.not_to permit(:destroy) }
  end

  context 'for a different user' do
    let(:user) { create(:user) }

    it { is_expected.not_to permit(:index) }
    it { is_expected.to permit(:show) }
    it { is_expected.not_to permit(:new) }
    it { is_expected.not_to permit(:edit) }
    it { is_expected.not_to permit(:create) }
    it { is_expected.not_to permit(:update) }
    it { is_expected.not_to permit(:destroy) }
  end

  context 'for the same user' do
    let(:user) { record }

    it { is_expected.not_to permit(:index) }
    it { is_expected.to permit(:show) }
    it { is_expected.not_to permit(:new) }
    it { is_expected.to permit(:edit) }
    it { is_expected.not_to permit(:create) }
    it { is_expected.to permit(:update) }
    it { is_expected.to permit(:destroy) }
  end

  context 'for an admin' do
    skip 'TODO'
  end
end

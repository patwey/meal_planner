# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    name 'Pat'
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
  end
end

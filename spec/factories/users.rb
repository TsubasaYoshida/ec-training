# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    screen_name { 'tsubasa' }
    email { 'tsubasa@example.com' }
    password { 'password' }
  end
end

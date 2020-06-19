# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :validatable,
         :registerable,
         :recoverable,
         :rememberable,
         :confirmable
end

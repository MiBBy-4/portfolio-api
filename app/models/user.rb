# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  has_secure_password
  has_many :projects, dependent: :destroy
  has_many :news, dependent: :destroy
end

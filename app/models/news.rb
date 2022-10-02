# frozen_string_literal: true

class News < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2, maximum: 250 }
  validates :description, presence: true, length: { minimum: 2, maximum: 2000 }

  belongs_to :user
end

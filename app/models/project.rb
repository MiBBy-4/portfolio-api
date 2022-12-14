# frozen_string_literal: true

class Project < ApplicationRecord
  include Commentable

  validates :title, presence: true, length: { minimum: 3, maximum: 250 }
  validates :description, presence: true, length: { maximum: 2500 }

  belongs_to :user
end

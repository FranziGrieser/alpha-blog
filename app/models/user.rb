# frozen_string_literal: true

class User < ApplicationRecord
  has_many :articles
  before_save { self.email = email.downcase }
  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = string[/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i]
  validates :email,
            presence: true,
            length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { width: VALID_EMAIL_REGEX }
end
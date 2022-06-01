# frozen_string_literal: true

class User < ApplicationRecord
  has_many :bookmarks

  validates :full_name, :email_address, :password, presence: true
  validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP }
end

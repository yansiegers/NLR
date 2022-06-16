# frozen_string_literal: true

class User < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_and_belongs_to_many :roles

  validates :email, :password, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :add_admin_role_to_first_user

  private

  def add_admin_role_to_first_user
    return if User.count != 1

    User.first.roles << Role.first
  end
end

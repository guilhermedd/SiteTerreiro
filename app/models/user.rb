class User < ApplicationRecord
  # Inclua os módulos do Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, exclusion: { in: ['admin'], message: "não pode ser 'admin'" }
  validates :email, uniqueness: { case_sensitive: false }
end

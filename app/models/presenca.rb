class Presenca < ApplicationRecord
  belongs_to :gira

  validates :gira, :email, :quantidade, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, uniqueness: { case_sensitive: false, scope: :gira_id, message: "Esse email já está associado com esse evento." }
end

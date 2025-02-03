class Presenca
  include Mongoid::Document
  include Mongoid::Timestamps

  field :email, type: String
  field :quantidade, type: Integer

  belongs_to :gira

  validates :gira, :email, :quantidade, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, uniqueness: { case_sensitive: false, scope: :gira_id, message: "Esse email já está associado com esse evento." }

  # Índice único para garantir a unicidade no MongoDB
  index({ email: 1, gira_id: 1 }, { unique: true })

end
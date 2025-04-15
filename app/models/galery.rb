# app/models/galery.rb
class Galery < ApplicationRecord

  has_many_attached :images, dependent: :destroy

  validates :title, presence: true
  validates :images, presence: true

  validates :title, uniqueness: true

  private

  def at_least_one_photo
    errors.add(:base, "Pelo menos uma foto deve ser adicionada") if images.blank?
  end
end
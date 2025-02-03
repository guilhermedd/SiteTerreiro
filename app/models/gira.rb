class Gira < ApplicationRecord
  has_many :presencas

  validates :event_date, :name, :type_of_gira, :description, presence: true

  def month_name
    months = {
      1 => "Janeiro",
      2 => "Fevereiro",
      3 => "Março",
      4 => "Abril",
      5 => "Maio",
      6 => "Junho",
      7 => "Julho",
      8 => "Agosto",
      9 => "Setembro",
      10 => "Outubro",
      11 => "Novembro",
      12 => "Dezembro",
    }
    months[event_date.month]
  end

  def start_time
    event_date
  end

  def get_day
    "%.2d/%.2d/%d" % [event_date.day, event_date.month, event_date.year]
  end
end

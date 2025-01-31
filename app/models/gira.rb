class Gira
  include Mongoid::Document
  include Mongoid::Timestamps
  field :event_date, type: Date
  field :name, type: String
  field :type_of_gira, type: String
  field :description, type: String
  field :confirmed_count, type: Integer, default: 0
  field :confirmed_emails, type: Array, default: []

  # Tornando o método público
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

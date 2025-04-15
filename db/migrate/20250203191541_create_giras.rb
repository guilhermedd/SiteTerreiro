class CreateGiras < ActiveRecord::Migration[6.0]
  def change
    create_table :giras do |t|
      t.date :event_date, null: false
      t.string :name, null: false
      t.string :type_of_gira, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end

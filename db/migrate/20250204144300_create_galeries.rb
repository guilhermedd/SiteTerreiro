class CreateGaleries < ActiveRecord::Migration[8.0]
  def change
    create_table :galeries do |t|
      t.string :name
      t.string :main_image

      t.timestamps
    end
  end
end

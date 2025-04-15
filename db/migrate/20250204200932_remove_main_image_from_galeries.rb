class RemoveMainImageFromGaleries < ActiveRecord::Migration[8.0]
  def change
    remove_column :galeries, :main_image, :string
  end
end

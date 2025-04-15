class RemoveImageFromGaleryPhotos < ActiveRecord::Migration[8.0]
  def change
    remove_column :galery_photos, :image, :string
  end
end

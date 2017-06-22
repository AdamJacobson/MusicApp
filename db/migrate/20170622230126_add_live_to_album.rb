class AddLiveToAlbum < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :live, :boolean
  end
end

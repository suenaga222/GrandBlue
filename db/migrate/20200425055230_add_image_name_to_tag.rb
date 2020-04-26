class AddImageNameToTag < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :image_name, :string
  end
end

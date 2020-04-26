class DeleteImageNameFromTags < ActiveRecord::Migration[6.0]
  def change
    remove_column :tags, :image_name, :string
  end
end

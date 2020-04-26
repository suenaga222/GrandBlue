class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :content
      t.string :tag
      t.integer :priority

      t.timestamps
    end
  end
end

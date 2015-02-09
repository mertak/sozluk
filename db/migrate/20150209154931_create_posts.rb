class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.string :title
      t.references :writer, index: true

      t.timestamps
    end
    add_index :posts, [:writer_id, :created_at]
  end
end

class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :writer, index: true

      t.timestamps
    end
    add_index :posts, [:writer_id, :created_at]
  end
end

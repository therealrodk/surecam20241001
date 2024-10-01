class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end

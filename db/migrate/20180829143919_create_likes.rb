class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :posts
      t.references :users
      t.boolean :status
      t.timestamps
    end
  end
end

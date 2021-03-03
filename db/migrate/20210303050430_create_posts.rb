class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :author
      t.string :title
      t.datetime :date
      t.text :description
      t.timestamps
    end
  end
end

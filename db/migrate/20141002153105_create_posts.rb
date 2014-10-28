class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true, :null => false
      t.string :body, :limit => 141, :null => false

      t.timestamps
    end
  end
end
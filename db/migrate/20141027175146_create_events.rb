class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user, index: true, :null => false
      t.string :name, :limit => 40, :null => false
      t.string :event_photo
      t.text :description
      t.datetime :event_time
      t.integer :age_limit
      t.string :link
      t.boolean :sold_out

      t.timestamps
    end
  end
end

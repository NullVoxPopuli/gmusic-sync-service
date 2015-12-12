class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :nid, null: false
      t.references :user
      t.timestamps null: false
    end
  end
end

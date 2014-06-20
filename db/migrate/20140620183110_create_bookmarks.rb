class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.references :topic, index: true
      t.references :user, index: true
      t.string :link

      t.timestamps
    end
  end
end

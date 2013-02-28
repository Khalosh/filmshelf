class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.references :user
      t.string :imdb
      t.string :media
      t.string :media_info
      t.string :seen

      t.timestamps
    end
    add_index :movies, :user_id
  end
end

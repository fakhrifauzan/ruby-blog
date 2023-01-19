class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :genres
      t.boolean :adult
      t.string :language
      t.string :overview
      t.float :popularity
      t.date :release_date
      t.string :status
      t.string :title

      t.timestamps
    end
  end
end

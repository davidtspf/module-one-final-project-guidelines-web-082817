class CreateGenresTable < ActiveRecord::Migration[5.0]
  def change
    create_table :genres do |t|
      t.string  :the_genre
    end
  end
end

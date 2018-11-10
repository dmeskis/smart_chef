class CreateFavoritesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites_tables do |t|
      t.references :user, foreign_key: true
      t.references :city, foreign_key: true
    end
  end
end

class CreateDoses < ActiveRecord::Migration[5.2]
  def change
    create_table :doses do |t|
      t.references :cocktail, foreign_key: true, index: true
      t.references :ingredient, foreign_key: true, index: true
      t.string :description

      t.timestamps
    end
  end
end

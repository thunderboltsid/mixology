class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.string :category
      t.text :description
      t.decimal :liqperc
      t.string :liqours
      t.string :mixers
      t.text :recipe

      t.timestamps null: false
    end
  end
end

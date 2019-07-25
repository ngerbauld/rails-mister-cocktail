class CreateDoses < ActiveRecord::Migration[5.2]
  def change
    create_table :doses do |t|
      t.string :description
      t.string :cocktail
      t.string :references
      t.string :ingredient
      t.string :references

      t.timestamps
    end
  end
end

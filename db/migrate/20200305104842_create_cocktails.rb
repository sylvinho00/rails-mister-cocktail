class CreateCocktails < ActiveRecord::Migration[5.2]
  def change
    create_table :cocktails do |t|
      t.string :name, uniqueness: true, presence: true, null: false, length: { minimum: 3 }

      t.timestamps
    end
  end
end

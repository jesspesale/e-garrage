class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :recipe_name
      t.string :ingredients
      t.string :instructions
      t.integer :cooktime
      t.integer :user_id
    end
  end
end

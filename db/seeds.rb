# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ing = Ingredient.create!(name: "pemon")
# cock = Cocktail.create!(name: "dock")
# dose = Dose.new(description: "70cl")
# dose.ingredient = ing
# dose.cocktail = cock
# dose.save!

Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all

filepath = 'db/ingredients.json'
serialized = File.read(filepath)
ingredients = JSON.parse(serialized)
ingredients["drinks"].each do |ingredient|
  # puts ingredient["strIngredient1"]
  Ingredient.create!(name: ingredient["strIngredient1"])
end
p Ingredient.all

Cocktail.create!(name: "Caipirona")
Cocktail.create!(name: "Caipirona Plus")
Cocktail.create!(name: "Caipirona Plus Plus")
p Cocktail.all

Cocktail.all.each do |cock|
  3.times do
    dose = Dose.new(description: Random.rand(20..200).to_s + "ml")
    dose.ingredient = Ingredient.find(Random.rand(0..Ingredient.count - 1))
    dose.cocktail = cock
    dose.save!
    puts dose
  end
end

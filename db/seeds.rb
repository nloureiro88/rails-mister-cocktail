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
Review.destroy_all

filepath = 'db/ingredients.json'
serialized = File.read(filepath)
ingredients = JSON.parse(serialized)
ingredients["drinks"].each do |ingredient|
  # puts ingredient["strIngredient1"]
  Ingredient.create!(name: ingredient["strIngredient1"])
end
p Ingredient.all

IMAGE = ["https://www.saveur.com/sites/saveur.com/files/styles/1000_1x_/public/copper-king-6_2000x1500.jpg?itok=vMhh96oB&fc=50,50",
         "https://cms.splendidtable.org/sites/default/files/styles/w2000/public/blt%20cocktail.jpg?itok=uv_d_Mjo",
         "https://mediacdn.grabone.co.nz/asset/xjGgV40A0S/refreshing-cocktail-recipes.jpg",
         "https://www.remymartin.com/wp-content/uploads/2016/07/15_Sidecar-2-1024x524.jpg",
         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxzSrpPvx41NJsSpmKvIzVRx3bCeGakLzNfK8leRbMT0aX36wg",
         "https://static01.nyt.com/images/2017/01/05/well/05quinine/05quinine-articleLarge-v2.jpg?quality=75&auto=webp&disable=upscale",
         "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Kamikaze-cocktail.jpg/1200px-Kamikaze-cocktail.jpg",
         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_yMOWvF4r1CTCMt-aro1XfF-JZHgzxeuIgKu0Pg4ebwSuzV_apw"]

8.times do |i|
  cock_name = Faker::TvShows::GameOfThrones.house
  new_cock = Cocktail.new(name: cock_name)
  until new_cock.valid?
    cock_name = Faker::TvShows::GameOfThrones.house
    new_cock = Cocktail.new(name: cock_name)
  end
  new_cock.remote_photo_url = IMAGE[i]
  new_cock.save!
end
p Cocktail.all

Cocktail.all.each do |cock|
  3.times do
    dose = Dose.new(description: Random.rand(20..200).to_s + " ml")
    dose.ingredient = Ingredient.find(Random.rand(0..Ingredient.count - 1))
    dose.cocktail = cock
    dose.save!
  end
  p cock.doses

  5.times do
    review = Review.new(rating: Random.rand(1..5))
    review.cocktail = cock
    review.save!
  end
  p cock.reviews
end

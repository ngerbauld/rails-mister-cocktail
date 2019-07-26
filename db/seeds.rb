# url  = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
# cocktail_json = open(url).read
# cocktail = JSON.parse(cocktail_json)
# cocktail["drinks"].each do |ele|
#  Ingredient.create(name: ele["strIngredient1"])
# end

require 'open-uri'
if Rails.env.development?
  Dose.destroy_all
  Ingredient.destroy_all
  Cocktail.destroy_all
end
url = "https://raw.githubusercontent.com/maltyeva/iba-cocktails/master/recipes.json"
repo = open(url).read
p recipes = JSON.parse(repo)

# recipes.each do |cocktail|
#   c = Cocktail.create!(name: cocktail["name"])
#   cocktail["ingredients"].each do |ingredient|
#     if ingredient["ingredient"]
#       i = Ingredient.find_or_create_by(name: ingredient["ingredient"])
#       d = Dose.create(description: ingredient["amount"].to_s + " " + ingredient["unit"], cocktail: c, ingredient: i)
#       puts "Added #{d.description} of #{i.name} to #{c.name}!"
#     end
#   end
# end

cocktails_image_url = "https://gist.githubusercontent.com/renandanton/8d99dab65bf9fb5b4465ded7ab73a7df/raw/2c5e0480bd239f76b055bb09f236f365e1530634/cocktails.json"
cocktails_image_json = open(cocktails_image_url).read
cocktails_image = JSON.parse(cocktails_image_json)["cocktails"]
puts "cocktail image-url done"
puts cocktails_image


recipes.each_with_index do |cocktail, index|
  puts cocktails_image[index]["image"].to_s
  c = Cocktail.create!(name: cocktail["name"], image: cocktails_image[index]["image"].to_s)
  cocktail["ingredients"].each do |ingredient|
    if ingredient["ingredient"]
      i = Ingredient.find_or_create_by(name: ingredient["ingredient"])
      d = Dose.create(description: ingredient[:amount].to_s + " " + ingredient["unit"], cocktail: c, ingredient: i)
      puts "added #{d.description} of #{i.name} to #{c.name}"
    end
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unicorn_pie       = Item.create(title: "Unicorn Pie",
                                description: "Gooooood",
                                price: 8,
                                status: "active")
medusa_hair_pasta = Item.create(title: "Medusa Hair Pasta",
                                description: "Gooooood",
                                price: 8,
                                status: "active")
pixie_bread_stix  = Item.create(title: "Pixie Bread Stix",
                                description: "Gooooood",
                                price: 8,
                                status: "active")
phoenix_curry     = Item.create(title: "Phoenix Spicy Curry",
                                description: "Gooooood",
                                price: 8,
                                status: "active")
titan_burger      = Item.create(title: "Titan Burger",
                                description: "Gooooood",
                                price: 8,
                                status: "active")

pasta_cat     = Category.create(name: "pasta")
burgers_cat   = Category.create(name: "burgers")
appetizer_cat = Category.create(name: "appetizer")

ItemCategory.create(item_id: medusa_hair_pasta.id, category_id: pasta_cat.id)
ItemCategory.create(item_id: titan_burger.id, category_id: burgers_cat.id)
ItemCategory.create(item_id: pixie_bread_stix.id, category_id: appetizer_cat.id)

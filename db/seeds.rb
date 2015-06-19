# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pasta_cat     = Category.new(name: "pasta")
burgers_cat   = Category.new(name: "burgers")
appetizer_cat = Category.new(name: "appetizer")
dessert_cat   = Category.new(name: "dessert")
curry_cat     = Category.new(name: "curry")

unicorn_pie       = Item.create(title: "Unicorn Pie",
                                description: "Gooooood",
                                price: 8,
                                status: "active",
                                categories: [dessert_cat])

medusa_hair_pasta = Item.create(title: "Medusa Hair Pasta",
                                description: "Gooooood",
                                price: 8,
                                status: "active",
                                categories: [pasta_cat])

pixie_bread_stix  = Item.create(title: "Pixie Bread Stix",
                                description: "Gooooood",
                                price: 8,
                                status: "active",
                                categories: [appetizer_cat])

phoenix_curry     = Item.create(title: "Phoenix Spicy Curry",
                                description: "Gooooood",
                                price: 8,
                                status: "active",
                                categories: [curry_cat])

titan_burger      = Item.create(title: "Titan Burger",
                                description: "Gooooood",
                                price: 8,
                                status: "active",
                                categories: [burgers_cat])

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pasta_cat     = Category.new(name: "pasta")
meat_cat      = Category.new(name: "burgers")
appetizer_cat = Category.new(name: "appetizer")
entree_cat    = Category.new(name: "entree")
dessert_cat   = Category.new(name: "dessert")
curry_cat     = Category.new(name: "curry")
seafood_cat   = Category.new(name: "seafood")
drinks_cat    = Category.new(name: "drinks")
special_cat   = Category.new(name: "special")

unicorn        = Item.create(title: "Unicorn on the Cob",
                             description: "A dish as enchanting and rare as the beast itself.",
                             price: 10.50,
                             status: "active",
                             categories: [entree_cat])

medusa         = Item.create(title: "Medusa Hair Pasta",
                             description: "Gooooood",
                             price: 12.99,
                             status: "active",
                             categories: [pasta_cat, entree_cat])

pixie          = Item.create(title: "Pixie Bread Stix",
                             description: "Gooooood",
                             price: 4.75,
                             status: "active",
                             categories: [appetizer_cat])

phoenix        = Item.create(title: "Phoenix Spicy Curry",
                             description: "Gooooood",
                             price: 11.50,
                             status: "active",
                             categories: [curry_cat, entree_cat])

titan          = Item.create(title: "Titan Burger",
                             description: "Gooooood",
                             price: 9.25,
                             status: "active",
                             categories: [meat_cat, entree_cat])

mermaid        = Item.create(title: "Filet of Mermaid",
                             description: "Gooooood",
                             price: 13.00,
                             status: "retired",
                             categories: [seafood_cat, entree_cat])

minotaur       = Item.create(title: "NY Strip Minotaur",
                             description: "Gooooood",
                             price: 19.99,
                             status: "active",
                             categories: [meat_cat, entree_cat])

scylla         = Item.create(title: "Scyllamari",
                             description: "Gooooood",
                             price: 17.50,
                             status: "retired",
                             categories: [seafood_cat, entree_cat])

griffin_wings  = Item.create(title: "Buffalo Griffin Wings",
                             description: "Gooooood",
                             price: 6.00,
                             status: "active",
                             categories: [meat_cat, appetizer_cat])

pegasus_wings  = Item.create(title: "Buffalo Pegasus Wings",
                             description: "Gooooood",
                             price: 6.00,
                             status: "retired",
                             categories: [meat_cat, appetizer_cat])

leg_of_griffin = Item.create(title: "Leg of Griffin",
                             description: "Gooooood",
                             price: 9.50,
                             status: "active",
                             categories: [meat_cat, entree_cat])

leg_of_pegasus = Item.create(title: "Leg of Pegasus",
                             description: "Gooooood",
                             price: 9.50,
                             status: "retired",
                             categories: [meat_cat, entree_cat])

hydra          = Item.create(title: "Hydra Vodka",
                             description: "Gooooood",
                             price: 6.00,
                             status: "active",
                             categories: [drinks_cat])

pygmy          = Item.create(title: "Pygmy Pie",
                             description: "Gooooood",
                             price: 5.50,
                             status: "active",
                             categories: [dessert_cat])

centaur        = Item.create(title: "Centaur Shank",
                             description: "Gooooood",
                             price: 18.00,
                             status: "active",
                             categories: [meat_cat, entree_cat])

cerberus       = Item.create(title: "Cerberus Chow",
                             description: "Gooooood",
                             price: 14.50,
                             status: "active",
                             categories: [meat_cat, entree_cat])

harpy          = Item.create(title: "BBQ Harpy Wings",
                             description: "Gooooood",
                             price: 6.50,
                             status: "active",
                             categories: [meat_cat, appetizer_cat])

manticore      = Item.create(title: "Manticornmeal",
                             description: "Gooooood",
                             price: 8.99,
                             status: "retired",
                             categories: [appetizer_cat])

siren          = Item.create(title: "Siren Stew",
                             description: "Gooooood",
                             price: 9.50,
                             status: "active",
                             categories: [meat_cat, appetizer_cat])

sphynx         = Item.create(title: "Sphynx Special",
                             description: "Surprise!",
                             price: 30.00,
                             status: "active",
                             categories: [special_cat])

cyclops        = item.create(title: "Cyclops Eye",
                             description: "Goooooood",
                             price: 5.00,
                             status: "retired",
                             categories: [appetizer_cat])

rachel = User.create(full_name: "Rachel Warbelow",
  email: "demo+rachel@jumpstartlab.com",
  password: "password")

jeff = User.create(full_name: "Jeff Casimir",
  email: "demo+jeff@jumpstartlab.com",
  password: "password",
  user_name: "j3")

jorge = User.create(full_name: "Jorge Tellez",
  email: "demo+jorge@jumpstartlab.com",
  password: "password",
  user_name: "novohispano")

admin = User.create(full_name: "Josh Cheek",
  email: "demo+josh@jumpstartlab.com",
  password: "password",
  user_name: "josh",
  role: 1)

Order.create(items: [unicorn, medusa, pixie],
             user_id: rachel.id,
             total_price: (unicorn.price + medusa.price + pixie.price),
             status: "ordered")

Order.create(items: [phoenix, titan, mermaid],
             user_id: jeff.id,
             total_price: (phoenix.price + medusa.price + pixie.price),
             status: "ordered")

Order.create(items: [minotaur, scylla, griffin_wings],
             user_id: jorge.id,
             total_price: (minotaur.price + scylla.price + griffin_wings.price),
             status: "paid")

Order.create(items: [pegasus_wings, leg_of_griffin, leg_of_pegasus],
             user_id: rachel.id,
             total_price: (pegasus_wings.price + leg_of_griffin.price + leg_of_pegasus.price),
             status: "paid")

Order.create(items: [hydra, pygmy, centaur],
             user_id: jeff.id,
             total_price: (hydra.price + pygmy.price + centaur.price),
             status: "cancelled")

Order.create(items: [cerberus, harpy, manticore],
             user_id: jorge.id,
             total_price: (cerberus.price + harpy.price + manticore.price),
             status: "cancelled")

Order.create(items: [siren, sphynx],
             user_id: rachel.id,
             total_price: (siren.price + sphynx.price),
             status: "ordered")

Order.create(items: [unicorn, titan, scylla],
             user_id: jeff.id,
             total_price: (unicorn.price + titan.price + scylla.price),
             status: "paid")

Order.create(items: [phoenix, minotaur, harpy],
             user_id: jorge.id,
             total_price: (phoenix.price + minotaur.price + harpy.price),
             status: "cancelled")

Order.create(items: [hydra, medusa, mermaid],
             user_id: rachel.id,
             total_price: (hydra.price + medusa.price + mermaid.price),
             status: "ordered")


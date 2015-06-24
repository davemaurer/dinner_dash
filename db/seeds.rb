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
                             description: "This dish is so good you'll feel like prince charming just rode in to save the day atop his trusty white stallio...er...unicorn",
                             price: 10.50,
                             status: "active",
                             categories: [entree_cat],
                             image: File.open('public/UnicornOnTheCob.jpg'))

medusa         = Item.create(title: "Medusa Hair Pasta",
                             description: "Freshly prepared by Perseus, our world-renowned and legendary (be)head chef",
                             price: 12.99,
                             status: "active",
                             categories: [pasta_cat, entree_cat],
                             image: File.open('public/MedusaHairPasta.jpg'))

pixie          = Item.create(title: "Pixie Bread Stix",
                             description: "Who knew bread sticks could make you feel so spritely!",
                             price: 4.75,
                             status: "active",
                             categories: [appetizer_cat],
                             image: File.open('public/PixieBreadStix.jpeg'))

phoenix        = Item.create(title: "Phoenix Spicy Curry",
                             description: "One bite and you'll feel reborn",
                             price: 11.50,
                             status: "active",
                             categories: [curry_cat, entree_cat],
                             image: File.open('public/PhoenixSpicyCurry.jpg'))

titan          = Item.create(title: "Titan Burger",
                             description: "So big and powerful it'll descend upon your tastebuds for an epic clash",
                             price: 9.25,
                             status: "active",
                             categories: [meat_cat, entree_cat],
                             image: File.open('public/TitanBurger.jpg'))

mermaid        = Item.create(title: "Filet of Mermaid",
                             description: "Only wild-caught...no farming here!",
                             price: 13.00,
                             status: "retired",
                             categories: [seafood_cat, entree_cat],
                             image: File.open('public/FiletOfMermaid.jpg'))

minotaur       = Item.create(title: "NY Strip Minotaur",
                             description: "A dish served as rare as the beast itself",
                             price: 19.99,
                             status: "active",
                             categories: [meat_cat, entree_cat],
                             image: File.open('public/NYStripMinotaur.jpg'))

scylla         = Item.create(title: "Scyllamari",
                             description: "Trust us when we say this dish isn't 'Charybian'",
                             price: 17.50,
                             status: "retired",
                             categories: [seafood_cat, entree_cat],
                             image: File.open('public/Scyllamari.jpg'))

griffin_wings  = Item.create(title: "Buffalo Griffin Wings",
                             description: "These little wings pack an especially powerful--maybe even majestic--punch",
                             price: 6.00,
                             status: "active",
                             categories: [meat_cat, appetizer_cat],
                             image: File.open('public/BuffaloGriffinWings.jpg'))

pegasus_wings  = Item.create(title: "Buffalo Pegasus Wings",
                             description: "One little bite will set your tastebuds aflight",
                             price: 6.00,
                             status: "retired",
                             categories: [meat_cat, appetizer_cat],
                             image: File.open('public/BuffaloPegasusWings.jpg'))

leg_of_griffin = Item.create(title: "Leg of Griffin",
                             description: "Suffice it to say the king of beasts makes a meal fit for kings",
                             price: 9.50,
                             status: "active",
                             categories: [meat_cat, entree_cat],
                             image: File.open('public/LegOfGriffin.jpg'))

leg_of_pegasus = Item.create(title: "Leg of Pegasus",
                             description: "This dish will send you galloping off to tasty bliss",
                             price: 9.50,
                             status: "retired",
                             categories: [meat_cat, entree_cat],
                             image: File.open('public/LegOfPegasus.jpg'))

hydra          = Item.create(title: "Hydra Vodka",
                             description: "Careful with this one! We serve it so virulent your friends may appear to have many heads",
                             price: 6.00,
                             status: "active",
                             categories: [drinks_cat],
                             image: File.open('public/HydraVodka.jpg'))

rainbow_pie          = Item.create(title: "Ogre Pie",
                             description: "We hope your appetite is as voracious as this dish's namesake",
                             price: 5.50,
                             status: "active",
                             categories: [dessert_cat],
                             image: File.open('public/OgrePie.jpg'))

centaur        = Item.create(title: "Centaur Sushi",
                             description: "Don't get 'carried away' with these bite size nibblers",
                             price: 18.00,
                             status: "active",
                             categories: [meat_cat, entree_cat],
                             image: File.open('public/CentaurSushi.jpg'))

cerberus       = Item.create(title: "Cerberus Chow",
                             description: "A snack popular with the hound guard of underworld",
                             price: 14.50,
                             status: "active",
                             categories: [meat_cat, entree_cat],
                             image: File.open('public/CerberusChow.jpg'))

harpy          = Item.create(title: "BBQ Harpy Wings",
                             description: "The wings of this fluttery creature--known for its thievery--are a steal themselves",
                             price: 6.50,
                             status: "active",
                             categories: [meat_cat, appetizer_cat],
                             image: File.open('public/BBQHarpyWings.jpg'))

manticore      = Item.create(title: "Manticorn Dogs",
                             description: "We'd urge you to leave the stick behind, though the beast itself might do otherwise",
                             price: 8.99,
                             status: "retired",
                             categories: [appetizer_cat],
                             image: File.open('public/corn_dog.jpg'))

siren          = Item.create(title: "Siren Stew",
                             description: "Ah, we're not surprised you've been lured by this dish. It'll make your tastebuds sing.",
                             price: 9.50,
                             status: "active",
                             categories: [meat_cat, appetizer_cat],
                             image: File.open('public/SirenStew.jpg'))

sphynx         = Item.create(title: "Sphinx Special",
                             description: "A veritable riddle of flavors, this dish is mythicised as merciless and treacherous",
                             price: 30.00,
                             status: "active",
                             categories: [special_cat],
                             image: File.open('public/SphynxSpecial.jpg'))

cyclops        = Item.create(title: "Cyclops Eyes",
                             description: "Unlike the monster, this dish has way more than one",
                             price: 5.00,
                             status: "retired",
                             categories: [appetizer_cat],
                             image: File.open('public/CyclopsEyes.jpg'))

rachel = User.create(full_name: "Rachel Warbelow",
                     email: "demo+rachel@jumpstartlab.com",
                     password: "password",
                     password_confirmation: "password")

jeff   = User.create(full_name: "Jeff Casimir",
                     email: "demo+jeff@jumpstartlab.com",
                     password: "password",
                     password_confirmation: "password",
                     user_name: "j3")

jorge  = User.create(full_name: "Jorge Tellez",
                     email: "demo+jorge@jumpstartlab.com",
                     password: "password",
                     password_confirmation: "password",
                     user_name: "novohispano")

admin  = User.create(full_name: "Josh Cheek",
                     email: "demo+josh@jumpstartlab.com",
                     password: "password",
                     password_confirmation: "password",
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

Order.create(items: [hydra, rainbow_pie, centaur],
             user_id: jeff.id,
             total_price: (hydra.price + rainbow_pie.price + centaur.price),
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

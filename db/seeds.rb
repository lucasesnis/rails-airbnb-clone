# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Service.create!(title: "Blanchisserie", description: "Nettoyez votre linge grâce à nos services de blanchisserie.")
Service.create!(title: "Réparations", description: "La réparation est la remise en état de ce qui a été endommagé.")
Service.create!(title: "Nettoyage", description: "Action, manière de nettoyer, en particulier un objet, un petit local.")


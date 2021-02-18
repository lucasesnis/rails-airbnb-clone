# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Transaction.destroy_all
Offer.destroy_all
Service.destroy_all

s1 = Service.new(title: "Blanchisserie", description: "Du lundi au dimanche, nos blanchisseurs sont disponibles pour nettoyer votre linge. Trouvez votre prestataire en quelques clics, nous nous chargeons du reste !")
file = URI.open('https://www.captaincontrat.com/hubfs/creer-marque-vetement-1.jpg')
s1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
s1.save!

s2 = Service.new(title: "Réparations", description: "Un petit pépin ? Du lundi au dimanche, nos mécaniciens sont disponibles pour réparer vos petits et gros dégâts. Trouvez votre prestataire en quelques clics, nous nous chargeons du reste !")
file = URI.open('https://www.centremultiservicesed.com/wp-content/uploads/2018/01/reparation-bateau-sablage-peinture.jpg')
s2.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
s2.save!

s3 = Service.new(title: "Nettoyage", description: "Besoin d'un petit coup de polish ? Du lundi au dimanche, nos techniciens sont disponibles pour nettoyer votre bateau. Trouvez votre prestataire en quelques clics, nous nous chargeons du reste !")
file = URI.open('https://www.nil-nettoyage.com/sites/default/files/styles/pleine_page/public/nil-nettoyage-bateau8.jpg')
s3.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
s3.save!

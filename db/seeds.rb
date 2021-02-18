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

o1 = Offer.create!(title: "Blanchisseur port de Cannes", description: "Plus blanc que blanc", service: Service.first, user: User.first, price: 10)
o2 = Offer.create!(title: "Blanchisseur Express", description: "Votre linge est lavé en moins de deux!", service: Service.first, user: User.last, price: 15)
o3 = Offer.create!(title: "Blanc du Nil", description: "On vous livre votre linge!", service: Service.first, user: User.find_by(email: "jmathieu.1997@gmail.com"), price: 20)

o1 = Offer.create!(title: "Mécanique et Réparation", description: "Mécaniciens professionnels", service: Service.find_by(title: "Réparations"), user: User.first, price: 100)
o2 = Offer.create!(title: "Mécanicien du port de Cannes", description: "Un bon coup de Polish!", service: Service.find_by(title: "Réparations"), user: User.last, price: 150)
o3 = Offer.create!(title: "Bateau Mécanique", description: "Mécanique pour toute taille de bateau!", service: Service.find_by(title: "Réparations"), user: User.find_by(email: "jmathieu.1997@gmail.com"), price: 200)

o1 = Offer.create!(title: "Nettoyeur port de Cannes", description: "La propreté c'est notre métier", service: Service.last, user: User.first, price: 10)
o2 = Offer.create!(title: "Agents de surfaces & Co", description: "Propreté avant tout", service: Service.last, user: User.last, price: 30)
o3 = Offer.create!(title: "Propreté terre & mer", description: "Pour partir en mer bien équipé", service: Service.last, user: User.find_by(email: "jmathieu.1997@gmail.com"), price: 25)


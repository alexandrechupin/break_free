puts "Cleaning breakfree database"
IncidentRecommendation.destroy_all
Recommendation.destroy_all
IncidentMotive.destroy_all
NonProfit.destroy_all
Motive.destroy_all
Proof.destroy_all
Testimony.destroy_all
Report.destroy_all
Incident.destroy_all
IncidentCategory.destroy_all
User.destroy_all
puts "Finished!"

require 'csv'

# puts 'Creating 4 fake breakfree users ..'
#   user_one = User.new(
#     email: "sarah@gmail.com",
#     password: "123456"
#     )
#   user_one.save!
#   user_two = User.new(
#     email: "lauriane@gmail.com",
#     password: "123456"
#     )
#   user_two.save!
#   user_three = User.new(
#     email: "ishan@gmail.com",
#     password: "123456"
#     )
#user_three.save!
#user_four = User.new(
#email: "alexandre@gmail.com",
#password: "123456"
#)
#user_four.save!
# puts 'Finished!'

puts "Creating incident categories and description..."
category_one = IncidentCategory.create!({name: "Agression physique",description: "Coups et blessures volontaires"})
category_two = IncidentCategory.create!({name: "Agression sexuelle",description: "Geste sexuel non consenti ou viol"})
category_three = IncidentCategory.create!({name: "Agression verbale",description: "Menaces, insultes, incitation à la haine,..."})
category_four = IncidentCategory.create!({name: "Discrimination",description: "Traitement différent lié à votre identité"})
puts "Finished !"



puts 'Creating 4 breakfree incidents...'
incident_one =Incident.create!({
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  date: Date.parse('2018-04-15'),
  recurrent: true,
  address: "45 rue oberkampf 75011 Paris",
  publication_agreement: true,
  place_type: "dans la rue",
  incident_category: category_one
  })
incident_two =Incident.create!({
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  date: Date.parse('2016-08-31'),
  recurrent: false,
  address: "24 rue parmentier 75011 Paris",
  publication_agreement: false,
  place_type: "dans un lieu accueillant du public",
  incident_category: category_two
  })
incident_three =Incident.create!({
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  date: Date.parse('2010-12-31'),
  recurrent: false,
  address: "20 rue de La Folie Mericourt 75011 Paris",
  publication_agreement: true,
  place_type: "dans mon lieu de travail",
  incident_category: category_three
  })
incident_four =Incident.create!({
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  date: Date.parse('2019-01-20'),
  recurrent: true,
  address: "167 rue Saint Honoré 75001 Paris",
  publication_agreement: false,
  place_type: "sur internet",
  incident_category: category_four
  })
puts 'Finished!'

puts "Creating motives..."
  motive_one = Motive.create!(name: "Orientation sexuelle")
  motive_two = Motive.create!(name: "Origine")
  motive_three = Motive.create!(name: "Genre")
  motive_five = Motive.create!(name: "Situation de handicap")
  motive_six = Motive.create!(name: "Statut sérologique")
  motive_seven = Motive.create!(name: "Autre")
puts 'Finished!'

puts "Creating non-profits..."
non_profit1 = NonProfit.create!({
    name: 'France Victimes',
    description: "France Victimes est composée de 130 associations d'aide aux victimes. L'objet de la Fédération est de promouvoir et de développer l'aide et l'assistance aux victimes, les pratiques de médiation et toute autre mesure contribuant à améliorer la reconnaissance des victimes.",
    contact_email: "victimes@france-victimes.fr",
    logo_url: "https://res.cloudinary.com/dg8fxmpur/image/upload/v1571327080/Capture_d_e%CC%81cran_2019-10-17_a%CC%80_17.41.07_xmz1he.png",
    motive: motive_seven
  })
 non_profit2 = NonProfit.create!({
    name: "Ravad",
    description: "Réseau d'assistance aux victime d'agressions et de discriminations à raison de leur orientation sexuelle, identité de genre et leur état de santé",
    contact_email: "urgence@ravad.org",
    logo_url: "https://res.cloudinary.com/dg8fxmpur/image/upload/v1571327080/Capture_d_e%CC%81cran_2019-10-17_a%CC%80_17.42.01_kpcopc.png",
    motive: motive_six
  })
 non_profit3 = NonProfit.create!({
    name: "SOS Homophobie",
    description: "SOS homophobie est une association loi 1901 de lutte contre les discriminations et les agressions à caractère homophobe et transphobe.",
    contact_email: "sos@sos-homophobie.org",
    logo_url: "https://res.cloudinary.com/dg8fxmpur/image/upload/v1571327080/Capture_d_e%CC%81cran_2019-10-17_a%CC%80_17.42.13_rebh9d.png",
    motive: motive_one
  })
 non_profit4 = NonProfit.create!({
    name: "SOS Racisme",
    description: "SOS Racisme est une association française créée en 1984, dont le but est la lutte contre le racisme, l'antisémitisme et plus généralement toutes les formes de discrimination.",
    contact_email: "internet@sos-racisme.org",
    logo_url: "https://res.cloudinary.com/dg8fxmpur/image/upload/v1571327080/Capture_d_e%CC%81cran_2019-10-17_a%CC%80_17.41.29_lt1ybr.png",
    motive: motive_two
  })
 non_profit5 = NonProfit.create!({
    name: "Solidarité Femmes",
    description: "Les associations Solidarité Femmes accompagnent chaque année plus de 30000 femmes victimes, hébergent plus de 3000 femmes et autant d’enfants.",
    contact_email: "contact@solidaritefemmes.org",
    logo_url: "https://res.cloudinary.com/dg8fxmpur/image/upload/v1571327080/Capture_d_e%CC%81cran_2019-10-17_a%CC%80_17.41.18_jk5mgj.png",
    motive: motive_three
  })
 non_profit5 = NonProfit.create!({
    name: "APF France Handicap",
    description: "Mouvement national de défense et de représentation des personnes en situation de handicap moteur avec ou sans troubles associés et de leur famille.",
    contact_email: "dr.iledefrance@apf.asso.fr",
    logo_url: "https://res.cloudinary.com/dg8fxmpur/image/upload/v1571327080/Capture_d_e%CC%81cran_2019-10-17_a%CC%80_17.41.43_xucaem.png",
    motive: motive_five
  })
puts "Finished !"

puts "Creating incident motives"
incident_motive1 = IncidentMotive.create!({
    incident: incident_one,
    motive: motive_two
  })
incident_motive2 = IncidentMotive.create!({
    incident: incident_two,
    motive: motive_seven
  })
incident_motive3 = IncidentMotive.create!({
    incident: incident_three,
    motive: motive_one
  })
incident_motive4 = IncidentMotive.create!({
    incident: incident_four,
    motive: motive_two
  })
incident_motive5 = IncidentMotive.create!({
    incident: incident_four,
    motive: motive_six
  })
puts "Finished !"

puts "Creating recommendations"
recommendation1 = Recommendation.create!({
    title: "Déposer plainte",
    description: "Il faut au plus tôt déposer une plainte au commissariat de police ou au poste de gendarmerie le plus proche",
    is_an_action: true
  })

recommendation2 = Recommendation.create!({
    title: "Transmettre un rapport anonyme à l'établissement concerné",
    description: "L’auteur-e de ces propos est employé-e d’un établissement recevant du public (un supermarché, une compagnie de transports, une discothèque…)? Cet établissement propose peut-être un service de médiation ou un service client. Si tel est le cas, vous pouvez prendre contact avec lui pour que la situation soit réglée par le dialogue, sans avoir recours à la justice.",
    is_an_action: true
  })

recommendation3 = Recommendation.create!({
    title: "Obtenir un certificat médical",
    description: "Il est indispensable d’avoir un certificat médical précisant la nature et la gravité des lésions ainsi que la durée de l’incapacité totale de travail. Pour une meilleure reconnaissance devant les tribunaux, la victime doit s’adresser aux unités médicojudiciaires des hôpitaux publics. Un certificat délivré par un·e médecin de ville ne suffit pas car ils et elles ne sont pas aptes à délivrer des ITT. En effet, la définition de l’incapacité totale de travail au sens du droit pénal, qui sera utilisée pour faire condamner l’agresseur·se, est plus restrictive que celle d’incapacité temporaire de travail (« arrêt de travail ») utilisée par les médecins de ville.",
    is_an_action: false
  })
recommendation4 = Recommendation.create!({
    title: "Consulter immédiatement un·e médecin",
    description: "Il est indispensable de se rendre dans une unité médico-judiciaire des hôpitaux publics afin de faire constater l’agression et de recevoir un traitement de post-exposition (au VIH) efficace.",
    is_an_action: false
  })
recommendation5 = Recommendation.create!({
    title: "Recueillir des preuves",
    description: "Il est impératif de récolter autant de preuves que possible (enregistrements, photos, vidéos, captures d’écran, témoignages, etc.).",
    is_an_action: true
})
puts "Finished !"

puts "Creating incident recommendations"
incident_recommendation1 = IncidentRecommendation.create!({
    incident_category: category_one,
    recommendation: recommendation3
  })
incident_recommendation2 = IncidentRecommendation.create!({
    incident_category: category_one,
    recommendation: recommendation4
  })
incident_recommendation3 = IncidentRecommendation.create!({
    incident_category: category_one,
    recommendation: recommendation1
  })
incident_recommendation4 = IncidentRecommendation.create!({
    incident_category: category_two,
    recommendation: recommendation3
  })
incident_recommendation5 = IncidentRecommendation.create!({
    incident_category: category_two,
    recommendation: recommendation4
  })
incident_recommendation6 = IncidentRecommendation.create!({
    incident_category: category_two,
    recommendation: recommendation1
  })
incident_recommendation7 = IncidentRecommendation.create!({
    incident_category: category_three,
    recommendation: recommendation1
  })
incident_recommendation8 = IncidentRecommendation.create!({
    incident_category: category_four,
    recommendation: recommendation1
  })
puts "Finished !"


# Parse the Tribunal Grand Instance file

require 'csv'

puts "Parsing CSV of TGIs"

csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
filepath = File.join(Rails.root, 'db', 'annuaire_ti.csv')

CSV.foreach(filepath, csv_options) do |row|
  tribunal = Tribunal.create!({
    name: row[1],
    address: "#{row[3]} – #{row[4]}",
    zipcode: row[6],
    city: row[7],
    phone: row[8],
    timings: row[9],
    url: row[13]
  })
end

puts "Oof. I've finished! Everything went alright 😉"




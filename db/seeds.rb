require 'faker'
require 'ffaker'

Attendance.destroy_all
Event.destroy_all
User.destroy_all

puts 'Database réinitialisée..'

#Créations d'utilisateurs ===============================================
20.times do 
    User.create!(
    email: Faker::Internet.email(domain: "yopmail.com"),
    password: Faker::Internet.password,
    description: Faker::Adjective.negative,
    first_name: FFaker::NameFR.first_name,
    last_name: FFaker::NameFR.last_name
    )
    sleep 0.5
end

puts 'Les utilisateurs ont bien été créé.'

# Création des événements ===============================================
User.all.each do |user|
5.times do
    # admin = User.all.sample
    Event.create(
    start_date: Faker::Time.between_dates(from: Time.now, to: Time.now + 50),
    title: Faker::Music.band,
    location: FFaker::AddressFR.city,
    description: FFaker::LoremFR.sentences,
    price: Faker::Number.between(from: 30, to: 150),
    duration: rand(30..120),
    admin_id: user.id
    )
    sleep 0.5
end
end

puts 'Les évènements ont bien été créé.'

# Création des participations ===============================================
30.times do
    user = User.all.sample
    event = Event.all.sample
    if user && event
      Attendance.create(
        stripe_customer_id: Faker::Alphanumeric.alphanumeric(number: 10), 
        user_id: user.id, 
        event_id: event.id
      )
      sleep 0.5
    end
  end

puts 'Les participations ont bien été créé.'
namespace :utils do
  desc "Adding Data"
  task seed: :environment do
    add_contacts
    add_addresses
    add_phones
  end

  private

  def add_contacts
    puts "Adding contacts..."
    100.times do |i|
        Contact.create! name: Faker::Name.name, 
                        email: Faker::Internet.email,
                        kind: Kind.all.sample, 
                        rmk: LeroleroGenerator.sentence(5)
    end
    puts "Adding contacts... [OK]"
  end

  def add_addresses
    puts "Adding addresses..."
    Contact.all.each do |contact|
        Address.create! street: Faker::Address.street_address, 
                        city: Faker::Address.city,
                        state: Faker::Address.state_abbr, 
                        contact: contact
    end
    puts "Adding addresses... [OK]"
  end

  def add_phones
    puts "Adding phones..."
    Contact.all.each do |contact|
      Random.rand(1..5).times do |i|
        Phone.create! phone: Faker::PhoneNumber.phone_number,
                      contact: contact
      end      
    end
    puts "Adding phones... [OK]"
  end

end

require_relative 'setup'


def help 
  puts "Here is a list of available commands:
  new - Create a new contact
  list - List all contacts 
  show - Show a contact
  find - Find a contact
  add - Add phone number(s) to existing contact"
end

case ARGV[0]
when "help"
  help
when "new"
  puts "What is the email?" 
  email = STDIN.gets.chomp
  puts "What is your first name"
  firstname = STDIN.gets.chomp
  puts "What is your last name"
  lastname = STDIN.gets.chomp

  contact = Contact.new(firstname: firstname, lastname: lastname, email: email )

  if contact.valid?
    contact.save
    puts "Your contact has been added!"
  else
    contact.errors.full_messages.each do |message|
      puts message
    end
  end
when "list"
  Contact.all.each do |contact|
    puts contact
  end
when "show"
  id = ARGV[1].to_i
  puts Contact.find(id)
when "find"
  term = ARGV[1].to_s
  termwildcard = "%#{term}%" 
  puts Contact.where("lastname LIKE ? OR firstname LIKE ? OR email LIKE ?", termwildcard, termwildcard,termwildcard )
else
  help
end

 




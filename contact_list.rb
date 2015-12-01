require_relative 'contact' 
require_relative 'contact_database'
require 'pry'
require 'csv'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets
# ARGV << '--help'

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
  puts "What is the name"
  name = STDIN.gets.chomp
  if Contact.duplicate(name, email) == false
    puts "This contact already exists."
  else
    Contact.create(name,email)
    puts "Your contact has been added!"
  end
when "list"
  puts Contact.all 
when "show"
  id = ARGV[1].to_i
  puts Contact.show(id -1) || "Check the ID number. Contact does not exist."
when "find"
  term = ARGV[1].to_s # can create potential variable of ARGV[1]
  puts Contact.find(term) ?  Contact.find(term) :  "Check your spelling! Contact does not exist."
else
  help
end


 




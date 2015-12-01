class Contact
 
  attr_reader :name, :email

  def initialize(name, email, id=nil) #id is optional here
    # TODO: assign local variables to instance variables
    @id = id
    @name = name
    @email = email
  end
 
  def to_s #overwrote object method here! This is why when you use 'puts' it takes this format
    # TODO: return string representation of Contact
    "ID: #{@id}, Name: #{@name}, Email: #{@email}"
  end
 
  ## Class Methods
  class << self
    attr_reader :contact_array

    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts #can make local variable
      Contact.new(name, email)
      index = ContactDatabase.read.size + 1
      contact_array = [index, name, email]
      ContactDatabase.add_contact(contact_array)
    end
 
    def find(term) 
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      contacts = Contact.all 
      match_contacts = []
      contacts.each do |contact|
        if contact.name.include?(term) || 
          contact.email.include?(term)
          match_contacts << contact
        end
      end
      match_contacts
    end

    def all
      # TODO: Return the list of contacts, as is
      contact_array = ContactDatabase.read
      contacts = []
      contact_array.each do |contact|
        contacts << Contact.new(contact[1],contact[2])
      end
      contacts
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      contact = ContactDatabase.read[id]
      return Contact.new(contact[1],contact[2], id+1) if contact
    end  

    def duplicate(name, email)
      contacts = Contact.all 
      contacts.each do |contact|
        if contact.name == name && 
          contact.email == email
          return false
        end
      end
    end
  end 
end




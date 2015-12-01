## TODO: Implement CSV reading/writing
class ContactDatabase

  def self.add_contact(contact_array) 
    CSV.open('contacts.csv', "ab") do |csv|
      csv << contact_array #appends new contact to the list! 
    end
  end

  def self.read
    contact_rows = []
    CSV.foreach('contacts.csv') do |row|
       contact_rows << row
    end
    contact_rows
  end
end

















class Contact < ActiveRecord::Base
  validates :firstname, :lastname, :email, presence: true
  validates :email, uniqueness: true
 
 def to_s

  "ID: #{id}, Name: #{firstname}, Email: #{email}"
 end 
end




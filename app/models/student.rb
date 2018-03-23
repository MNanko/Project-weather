class Student < ActiveRecord::Base
  
  validates :name, :lastname, :birthdate, presence:true
end

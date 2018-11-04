class User < ApplicationRecord
#le champs 'name' doit etre non-nil, ne doit pas etre vide, longueur max 50 car
    validates :name, presence: true, length: { maximum: 50 }
#stock dans une var le regex type 'format d'email valide'
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#le champs 'email' doit etre non-nil, ne doit pas etre vide , longueur max 255 car,
# et conforme a la var 'VALID_EMAIL_REGEX'
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX }, 
                      uniqueness: true
  
end

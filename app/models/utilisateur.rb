class Utilisateur < ApplicationRecord
  validates :nom   ,presence:true ,length:{maximum: 50}

  VALID_EMAIL = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/

  validates :email ,presence: true ,length:{maximum: 255} , format:{with: VALID_EMAIL} , uniqueness:{case_sensitive: false}


  has_many :articles, dependent: :destroy
  has_secure_password
  validates :password   ,presence:true ,length:{minimum: 6}


end

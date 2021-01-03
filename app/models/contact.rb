class Contact < ApplicationRecord
	## validation
	validates :first_name, presence: :true
	validates :last_name, presence: :true
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
	validates :phone,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 10 }
end

class User < ApplicationRecord

	after_create :welcome_send

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Merci d'inserer un email valide" }
	validates :first_name, presence: true, name: true
	validates :last_name, name: true, on: :update, unless: Proc.new{|u| u.encrypted_password_changed? }
	validates :description, text:true, on: :update, unless: Proc.new{|u| u.encrypted_password_changed? }
	validates :encrypted_password, presence: true, length: {minimum: 6} 
    
    has_many :attendances
    has_many :events, through: :attendances
	has_many :events, foreign_key: 'admin_id'
	

	def welcome_send
		UserMailer.welcome_email(self).deliver_now
	  end

end

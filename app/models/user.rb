class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         enum status:[:Default, :Accept, :Reject]
         paginates_per 4
        attribute :user
        has_many_attached :files_Upload


        validates :first_name,:last_name,presence: true,length: { minimum: 3 },:on =>:update
        validates :address,presence: true,:on =>:update
        validates :zipcode, presence:true, length:{is: 5},:on =>:update
        validates :phone_number, presence: true,format: { with: /\(?[\d]{4}\)?[\s|-]?[\d]{7}/,
        message: "only allows letters" },:on =>:update
        validates :cnic,presence: true,uniqueness: true,format: { with: /\(?[\d]{5}\)?[\s|-]?[\d]{7}-?[\d]{1}/,
        message: "only allows letters" },:on =>:update
        validates :email,presence: true,:on =>:update
        validates :dob,:state,:city,presence: true,:on =>:update

end



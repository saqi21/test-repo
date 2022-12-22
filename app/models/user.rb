class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         enum status:[:Default, :Accept, :Reject]
         paginates_per 4
        attribute :user
        has_many_attached :files_Upload

      
end

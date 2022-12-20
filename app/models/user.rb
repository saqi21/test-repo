class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         attribute :user
        has_one_attached :image
        has_one_attached :pdffile
        has_one_attached :pdffile2
        has_one_attached :docFile

      
end

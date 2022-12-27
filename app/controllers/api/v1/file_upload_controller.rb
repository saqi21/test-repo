class Api::V1::FileUploadController < ActionController::API
require 'csv'
	def create
		file=params[:file]
		file=File.open(file)
		csv=CSV.parse(file,headers: true)
		
		csv.each do |row|

			User.create(password: row[0], email: row[1], 
						first_name: row[2], last_name: row[3], 
						dob: row[4], phone_number: row[5],cnic: row[6],
						address: row[7],gender:[8])
		end
	end
end








 # before_action :check_basic_auth
 #      skip_before_action :verify_authenticity_token
 #      private
 #      def check_basic_auth
 #        unless request.authorization.present?
 #          head :unauthorized
 #          return
 #        end
 #        authenticate_with_http_basic do |email, password|
 #          user = User.find_by(email: email.downcase)
 #          if user && user.authenticate(password)
 #            @current_user = user
 #          else
 #            head :unauthorized
 #          end
 #        end
 #      end
 #      def current_user
 #        @current_user
 #      end
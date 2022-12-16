class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def new 
    @user=User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
  	byebug
    @user=User.new(user_params)
    if @user.save
      render 'formsecondPage'
    else
      render 'new'
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:first_name,:last_name,:email,
                                 :phone_number,:dob,:cnic,:address,
                                 :pdffile,:pdffile2,:image,:docFile)
  end
end

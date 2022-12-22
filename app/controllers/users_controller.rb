class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
      if current_user.admin?
          @q=User.ransack(params[:q])
          @users=@q.result(distinct: true).page(params[:page])
      else
        @users=User.where(id:current_user.id)
      end
  end
  def edit
    @user=User.find(current_user.id)
  end

  def show
    @user = User.find(current_user.id)
  end

  def update
    @user=User.find(current_user.id)
    if @user.update(user_params)
      VerificationEmailMailer.verify_email(@user).deliver_now
      render 'verificationModuel'
    else
      render 'edit'
    end
  end
  # def file_upload
  #   @user=User.find(current_user.id)
  #   if @user.update(file_params)
  #   VerificationEmailMailer.verify_email(@user).deliver_now
  #   render "verificationModuel"
  #   else
  #     render 'edit'
  #   end
  # end
  private
  def user_params
    params.require(:user).permit(:first_name,:last_name,:email,
                                 :phone_number,:dob,:cnic,:address,
                                 :state,:zipcode,:city,:files_Upload)
  end
  # def file_params
  #   params.require(:user).permit(:pdffile,:pdffile2,:image,:docFile)
  # end
end

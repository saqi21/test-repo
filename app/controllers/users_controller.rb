class UsersController < ApplicationController
  before_action :authenticate_user! 
  $email_code=''
  $phone_code=''
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
  
  def send_emailCode
    @user=User.find(current_user.id)
    $email_code=rand.to_s[2..7]
    VerificationEmailMailer.verify_email(@user,$email_code).deliver_now
    render 'verificationModuel'
  end
   def verify_email_code
    if $email_code==params[:user][:verifyCode]
        current_user.update(email_verify: true)
        flash[:alert]="Verified Successfully"
    else
        flash[:alert]="Verified UnSuccessfully"
    end
    render 'verificationModuel'
  end


  def send_phoneCode
      @user=User.find(current_user.id)
      $phone_code=rand.to_s[2..7]
      @message="Hello "+current_user.first_name+" Here is Your Phone Verifcation OTP Code "+$phone_code.to_s
      if TwilioClient.new.send_text(@user,@message)
        flash[:alert]="SMS sent Successfully"
      else
        flash[:alert]="SMS sent Unsuccessfully"
      end
      render 'verificationModuel'
  end
  def verify_phoneCode
    if $phone_code==params[:user][:verifyPhoneCode]
      current_user.update(phone_verify: true)
      flash[:alert]="Verified Successfully"
    else
      flash[:alert]="Verified UnSuccessfully"
    end
    render 'thankyou'
  end

def thankyou; end
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

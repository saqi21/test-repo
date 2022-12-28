Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  namespace :api do
    namespace :v1 do
      resources :file_upload, only: [:create]
  end
end
  resources :users, only: [:edit,:update,:show]
  # put "users/file_upload", to: "users#file_upload"
  get 'users/:id/verify_user', to: 'users#verificationModuel'     ,as:"verificatoin_module"
  get 'users/:id/sent_email_OTP_Code',to: 'users#send_emailCode'  ,as:"sent_otp_on_email"
  get 'users/:id/email_verified'  ,to: 'users#verify_email_code'   ,as:"verified_email"
  get 'users/:id/sent_Phone_OTP_Code', to: 'users#send_phoneCode' ,as:"sent_otp_on_phone"
  get 'users/:id/phone_verified'  ,to: 'users#verify_phoneCode'    ,as:"verified_phone"
  get 'users/:id/status_accepted' ,to: 'users#status_approved'     ,as: "accept_application"
  get 'users/:id/status_rejected' ,to: 'users#userReject'          ,as: "reject_application"
  #get 'users/:id/thankyou_page'   ,to: 'users#thankyou_page'       ,as:"thankyou_page"
  #post 'users/:id/file_imported' ,to:"users#import"
end

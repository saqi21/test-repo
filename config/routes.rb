Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users, only: [:edit,:update]
  # put "users/file_upload", to: "users#file_upload"
  get 'users/verify', to: 'users#verificationModuel'
  get 'users/sent_email_OTP_Code',to: 'users#send_emailCode'
  get 'users/email_verified', to: 'users#verify_email_code'
  get 'users/sent_Phone_OTP_Code', to: 'users#send_phoneCode'
  get 'users/phone_verified', to: 'users#verify_phoneCode'

end

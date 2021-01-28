class Users::RegistrationsController < Devise::RegistrationsController
 def after_sign_up_path_for(resource)
  user_path(resource) 
 end

#アカウント編集後のリダイレクト先
 def after_update_path_for(resource)
  users_path(resource) 
 end
end 
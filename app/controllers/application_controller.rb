class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource_or_scope)#ログイン後
    # if resource.sign_in_count == 1
    #     user_path(current.id)
    # else
        posts_path
    # end
  end


  def after_sign_out_path_for(resource_or_scope)#ログアウト
      new_user_session_path
  end

  # protected
  # def configure_permitted_parameters
  #   # アカウント編集のストロングパラメータを追加
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_image_id, :style, :birthday, :sex, :introduction])
  # end

end

class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)#ログイン後
    if resource.sign_in_count == 1 #初回ログイン判定
      edit_user_path(current_user)
    else
      posts_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)#ログアウト
      new_user_session_path
  end

end

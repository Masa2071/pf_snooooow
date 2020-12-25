class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource_or_scope)
    if resource.sign_in_count == 1
        user_path(current.id)
    else
        pots_path
    end
  end


  def after_sign_out_path_for(resource_or_scope)
      new_user_session_path
  end

end

module SessionsHelper
  
  def sign_in(user)
    session[:remember_token] = user.id
  end
  
  def signed_in?
    return true if session[:remember_token]
    false
  end
  
  def sign_out
    session[:remember_token] = nil
  end
  
  def current_user
    User.find(session[:remember_token])
  end  
end

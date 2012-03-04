module SessionsHelper
  
  def signed_in?
    return true if session[:remember_token]
    false
  end
  
  def sign_out
    session[:remember_token] = nil
  end
  
end

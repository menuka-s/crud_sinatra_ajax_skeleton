module LoginHelper
  def logged_in?
    return false if session[:user_id] == nil
    return true
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

end

helpers LoginHelper

class TopController < ApplicationController
  def main
    @tweets = Tweet.all
    @user_id = session[:login_uid]
  #  if session[:login_uid] != nil
      render "main"
  #  else
  #    render "login"
  #  end
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user != nil
      if BCrypt::Password.new(user.pass) == params[:pass]
        session[:login_uid] = params[:uid]
        redirect_to top_main_path
      else
        render "error"
      end
    else
      render "error"
    end
  end
  
  def login_form
    render 'login_form'
  end
  
  def logout
    session.delete(:login_uid)
    redirect_to top_main_path
  end
end
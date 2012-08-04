class SessionsController < ApplicationController
  def create
    sendWelcomeEmail = User.not_a_current_user?(env["omniauth.auth"]) ? true:false

    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url

    if sendWelcomeEmail
      UserMailer.welcome_email(user).deliver
    end

  end

  def destroy
    session[:user_id] = nil

    if !session[:whats_new].nil?
      ids_to_keep = []
     
      session[:whats_new].each do |s|
        logger.debug s
        if WhatsNewMessage.find(s).is_user_specific?
          ids_to_keep = [ids_to_keep, s].flatten
        end
      end
      session[:whats_new] = ids_to_keep

    end

    # reset_session
    redirect_to root_url
  end
end



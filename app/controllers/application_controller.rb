class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_authorized_account

  private
  def set_authorized_account
    uuid = session[:uuid]
    token = Token.where('expiration_date > ?', Time.now).find_by_uuid(uuid) unless uuid==nil
    if(token)
      @authorized_account = AccountsToTokensCatalog.find_by_token_id(token.id).account
    end
  end

  def check_authorized
    if(@authorized_account)
    else
      false
    end
  end
end

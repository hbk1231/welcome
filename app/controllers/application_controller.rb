class ApplicationController < ActionController::Base
  before_filter :set_locale
  protect_from_forgery
  
private

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
    # current_user.locale
    # request.subdomain
    # request.env["HTTP_ACCEPT_LANGUAGE"]
    # request.remote_ip
  end
  
  def default_url_options(options = {})
    {locale: I18n.locale}
  end
end

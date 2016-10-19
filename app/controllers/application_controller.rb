class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t ".danger"
      redirect_to login_url
    end
  end

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end

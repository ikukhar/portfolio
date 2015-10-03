class HomeController < ApplicationController

  before_action :authenticate_user!, only: [:send_message]
  skip_before_action :verify_authenticity_token

  def index
  end

  def contacts
  end

  def send_message
    UserMailer.message_email(current_user, params[:message]).deliver_now
    redirect_to :contacts, alert: "Your message successfully sended"
  end

end

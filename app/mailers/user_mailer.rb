class UserMailer < ActionMailer::Base

  def message_email(user, message)
    mail(to: ENV['MY_MAIL'], :subject => 'Message from user') do |format|
      format.html { render html: "Name: #{user.name} #{user.surname}
      <br> Phone: #{user.phone}
      <br> Email: #{user.email}
      <br> Message: #{message}".html_safe }
    end
  end

end
